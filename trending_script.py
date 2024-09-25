import os
import time
from pytrends.request import TrendReq
from datetime import datetime

# Google 트렌드 API 클라이언트 초기화
pytrends = TrendReq(hl='ko', geo='KR')

# 절대 경로를 사용하여 파일 저장 위치 설정
csv_file_path = os.path.join(os.getcwd(), "trending_searches.csv")

# 1분마다 트렌드 데이터를 가져오는 함수
def get_trending_data():
    try:
        # 실시간 트렌딩 검색어 데이터 가져오기
        trending_searches_df = pytrends.trending_searches(pn='south_korea')

        # 현재 날짜와 시간 추가
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        print(f"{timestamp}")  # 현재 시간 출력
        print(trending_searches_df.head())  # 가져온 데이터의 상위 5개 출력

        # 데이터를 CSV 파일에 저장 (절대 경로 사용)
        with open(csv_file_path, mode='a', encoding='utf-8') as f:
            # 타임스탬프 저장
            f.write(f"{timestamp}\n")
            # 검색어 저장
            for search_term in trending_searches_df[0]:
                f.write(f"{search_term}\n")
            f.write("\n")  # 구분을 위해 빈 줄 추가
    except Exception as e:
        print(f"에러 발생: {e}")

# 1분마다 트렌드 데이터를 가져오는 루프
if __name__ == "__main__":
    while True:
        get_trending_data()
        time.sleep(60)  # 1분 (60초) 대기
