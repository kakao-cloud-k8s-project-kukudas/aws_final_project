## 해야하는 일
- mysql은 pv와 연결했지만 moodle의 data은 연결안함..안해도 돌아가긴 하는 듯

- 설치 페이지 들어가면 여러 에러가 뜸, 환경변수로 처리하면 될듯..?
1. 데이터 보관할 위치, /opt은 사용할 수 없다고 뜸, /bitnami/test로 하면 됨
2. db는 mariadb, host은 clusterIP를 입력
3. mysql file 타입 Barracuda file format으로 변경
4. mysql 'innodb_large_prefix' to 'ON'으로 변경

- moodle-dev.yaml env ```MOODLE_DATABASE_HOST``` 그냥 deployment?이름을 주면</br>환경변수가 ip을 자동으로 인식 못함</br>
직접 인자로 mysql clusterIP을 넣어야 함
---
## 배포 순서
1. ```kubectl apply -f metallb.yaml```
2. ```kubectl apply -f pv.yaml```
3. ```kubectl apply -f mysql-dev.yaml```
4. ```kubectl apply -f mysql-service.yaml``` : mysql clusterIP
5. ```kubectl apply -f moodle-dev.yaml```
6. ```kubectl apply -f moodle-service.yaml``` : moodle lb
---