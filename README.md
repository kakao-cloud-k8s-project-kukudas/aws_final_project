![header](https://capsule-render.vercel.app/api?type=waving&color=FFA07A&height=300&section=header&text=Team%20Kukudas%20🐱&fontSize=90&animation=fadeIn&fontAlignY=38&desc=Kakao%20CloudSchool%20Engineer%20Class%201st%20term&fontColor=FFFFFF&descAlignY=50&descAlign=53)

# 교육 기관용 그룹웨어 구축 및 제공 (Provision AWS resources with Terraform)



## Description

> 2022.11.01 - 2021.12.13

## Contests

📌 2022 카카오 클라우드 스쿨 엔지니어 양성과정 1기 최종 프로젝트

<br>

## Summary


## Implementation Plan
### 인프라 구축
  - Terraform을 이용한 AWS 기반 클라우드 인프라 구축 (EKS, LB, VPC, 이중화 배포)
  - DR 대비를 위한 여러 개의 zone에 노드 배포 및 Auto scailing 설정
  
### 노드 관리
  - 각 기관별로 Moodle, 모니터링 시스템을 배포하기 위한 도커 이미지 생성
   (Moodle: 오픈 소스 전자학습 플랫폼, 교육자의 온라인 학습을 지원하고 관리) 
  - Ansible을 이용해 pod 배포 및 노드 관리 진행
  
### 서비스 제공
  - 각 기관에 제공할 수 있는 모니터링 대쉬보드 제공 (Prometheus, Grafana 이용)
  - 메인 홈페이지를 구축해(Django) 교육기관의 기관명과 SLA를 입력받은 후, RDS에 저장
  - 해당 SLA를 만족시키는 HPA 구현 

<!-- <img src=images/summary.jpg  width="70%"/> -->

<!-- * 웹 페이지
  * 주차 현황 열람
  * 정기권 이용자를 위한 정기권 연장 / 잔여 사용기간 관리 기능
  * 관리자를 위한 장기 주차 및 정기권 만료 차량 모니터링 기능
* 주차장
  * 센서를 활용한 주차여부 정보 수집
  * LED 스트립을 활용한 주차 유도

<br>

<br>

<br>

## About Project

### Parking Lot

<img src="https://img.shields.io/badge/Language-C / C++-green?style=flat"/><img src="https://img.shields.io/badge/Platform-Arduino-blue?style=flat"/>

* 초음파 센서를 사용한 차량 감지 및 데이터 수집
* 이용자가 선호하는 자리 순으로 주차 자리 유도
* nodeMCU 사용하여 주차장 정보를 중앙서버에 전송하는 Wifi 통신

<br>

### Web

<img src="https://img.shields.io/badge/Language-PHP-green?style=flat"/><img src="https://img.shields.io/badge/Server-AWS EC2-blue?style=flat"/><img src="https://img.shields.io/badge/DB-MySQL + AWS RDS-yellow?style=flat"/>

* 차량 상태 정보를 DB에 업로드
* 웹 페이지를 통한 차량 정보 열람
* 주차장 정보를 수집하고 관리하는 DB 구축
* AWS RDS 생성하여 DB 구축
* DB 상의 정보를 사용자에게 제공하는 웹 페이지
* AWS EC2 인스턴스를 생성하여 서버 구축

<br>

<br>

<br>

## Results

### H/W

- Parking Lot

<img src=images/parking_line.png  width="60%"/><img src=images/parking.jpg  width="40%"/>


<br>

<br>

### S/W

* Web Page

|  기능  |화면|
|-------------|---------------------------|
|사용자 모드|<img src=images/web_main.png  width="60%"/>|
|관리자 모드|<img src=images/web_admin.png  width="60%"/>|



<br>

* QRCode : Linked to Web Page

<img src=images/QRCode.png  width="10%"/>

<br>

<br> -->
