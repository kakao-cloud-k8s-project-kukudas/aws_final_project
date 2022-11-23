### 사용 방법
---
metallb.yaml 배포
pv.yaml => mysql-dev.yaml => mysql-service.yaml => wordpress-dev.yaml => wordpress-service.yaml => lb.yaml 배포

wordpress-service.yaml은 없어도 될듯..?<br/>
lb.yaml로 생성된 loadbalancer 주소로 들어가면 됨
생성되는데 오래걸림..