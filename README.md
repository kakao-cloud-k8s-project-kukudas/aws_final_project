![header](https://capsule-render.vercel.app/api?type=waving&color=FFA07A&height=300&section=header&text=Team%20Kukudas%20๐ฑ&fontSize=90&animation=fadeIn&fontAlignY=38&desc=Kakao%20CloudSchool%20Engineer%20Class%201st%20term&fontColor=FFFFFF&descAlignY=50&descAlign=53)

# ๊ต์ก ๊ธฐ๊ด์ฉ ๊ทธ๋ฃน์จ์ด ๊ตฌ์ถ ๋ฐ ์ ๊ณต <br>(Provision AWS resources with Terraform)

## Demo video 
https://www.youtube.com/watch?v=dLmNjxRBg_U

<br>

## Description

> 2022.11.01 - 2021.12.13

<br>

## Contests

๐ 2022 ์นด์นด์ค ํด๋ผ์ฐ๋ ์ค์ฟจ ์์ง๋์ด ์์ฑ๊ณผ์  1๊ธฐ ์ต์ข ํ๋ก์ ํธ

<br>

## Architecture
![Arch](https://user-images.githubusercontent.com/70618223/207789487-49b7f678-1064-4b89-adfb-6ba2e8f875b5.png)


<br>

## Implementation Plan

### ์ธํ๋ผ ๊ตฌ์ถ
  - Terraform์ ์ด์ฉํ AWS ๊ธฐ๋ฐ ํด๋ผ์ฐ๋ ์ธํ๋ผ ๊ตฌ์ถ (EKS, LB, VPC, ์ด์คํ ๋ฐฐํฌ)
  - DR ๋๋น๋ฅผ ์ํ ์ฌ๋ฌ ๊ฐ์ zone์ ๋ธ๋ ๋ฐฐํฌ ๋ฐ Auto scailing ์ค์ 
  
### ๋ธ๋ ๊ด๋ฆฌ
  - ๊ฐ ๊ธฐ๊ด๋ณ๋ก Moodle, ๋ชจ๋ํฐ๋ง ์์คํ์ ๋ฐฐํฌํ๊ธฐ ์ํ ๋์ปค ์ด๋ฏธ์ง ์์ฑ
   (Moodle: ์คํ ์์ค ์ ์ํ์ต ํ๋ซํผ, ๊ต์ก์์ ์จ๋ผ์ธ ํ์ต์ ์ง์ํ๊ณ  ๊ด๋ฆฌ) 
  - Ansible์ ์ด์ฉํด pod ๋ฐฐํฌ ๋ฐ ๋ธ๋ ๊ด๋ฆฌ ์งํ
  
### ์๋น์ค ์ ๊ณต
  - ๊ฐ ๊ธฐ๊ด์ ์ ๊ณตํ  ์ ์๋ ๋ชจ๋ํฐ๋ง ๋์ฌ๋ณด๋ ์ ๊ณต (Prometheus, Grafana ์ด์ฉ)
  - ๋ฉ์ธ ํํ์ด์ง๋ฅผ ๊ตฌ์ถํด(Django) ๊ต์ก๊ธฐ๊ด์ ๊ธฐ๊ด๋ช๊ณผ SLA๋ฅผ ์๋ ฅ๋ฐ์ ํ, RDS์ ์ ์ฅ
  - ํด๋น SLA๋ฅผ ๋ง์กฑ์ํค๋ HPA ๊ตฌํ 

<br>

## Expected effect

1) ํด๋ผ์ฐ๋ ์ธํ๋ผ๋ฅผ ์ด์คํ ์๋ฒ๋ก ๊ตฌ์ถํ๋ฉฐ ๋ฌด์ค๋จ ์๋น์ค๋ฅผ ์ ๊ณตํ  ์ ์๋ค. 
2) ํธ๋ํฝ์ ๋ฐ๋ผ pod์ worker ๋ธ๋์ ์ ์กฐ์ ์ ํตํด ์ด์ฉ ๋น์ฉ ์ ๊ฐํ๋ค.
3) pod๋ก ๊ต์ก์ฉ ๊ทธ๋ฃน์จ์ด๋ฅผ ๋ฐฐํฌํจ์ผ๋ก์จ ๊ตฌ์ถ์๊ฐ์ ์ ๊ฐํ๋ค.
4) ๊ต์ก์ฉ ๊ทธ๋ฃน์จ์ด๋ฅผ ๊ตฌ์ถํด๋ด์ผ๋ก์จ ๊ต์ก์ฉ ๋ฟ๋ง ์๋๋ผ ๊ธฐ์์๊ฒ ์ ๊ณตํ  ์ ์๋ ๊ทธ๋ฃน์จ์ด ๊ตฌ์ถ์
๊ธฐ๋ฐ์ ๋ค์ง ์ ์๋ค.

<!-- ## About Project

## Results -->

<!-- <img src=images/summary.jpg  width="70%"/> -->

<!-- * ์น ํ์ด์ง
  * ์ฃผ์ฐจ ํํฉ ์ด๋
  * ์ ๊ธฐ๊ถ ์ด์ฉ์๋ฅผ ์ํ ์ ๊ธฐ๊ถ ์ฐ์ฅ / ์์ฌ ์ฌ์ฉ๊ธฐ๊ฐ ๊ด๋ฆฌ ๊ธฐ๋ฅ
  * ๊ด๋ฆฌ์๋ฅผ ์ํ ์ฅ๊ธฐ ์ฃผ์ฐจ ๋ฐ ์ ๊ธฐ๊ถ ๋ง๋ฃ ์ฐจ๋ ๋ชจ๋ํฐ๋ง ๊ธฐ๋ฅ
* ์ฃผ์ฐจ์ฅ
  * ์ผ์๋ฅผ ํ์ฉํ ์ฃผ์ฐจ์ฌ๋ถ ์ ๋ณด ์์ง
  * LED ์คํธ๋ฆฝ์ ํ์ฉํ ์ฃผ์ฐจ ์ ๋

<br>

<br>

<br>

## About Project

### Parking Lot

<img src="https://img.shields.io/badge/Language-C / C++-green?style=flat"/><img src="https://img.shields.io/badge/Platform-Arduino-blue?style=flat"/>

* ์ด์ํ ์ผ์๋ฅผ ์ฌ์ฉํ ์ฐจ๋ ๊ฐ์ง ๋ฐ ๋ฐ์ดํฐ ์์ง
* ์ด์ฉ์๊ฐ ์ ํธํ๋ ์๋ฆฌ ์์ผ๋ก ์ฃผ์ฐจ ์๋ฆฌ ์ ๋
* nodeMCU ์ฌ์ฉํ์ฌ ์ฃผ์ฐจ์ฅ ์ ๋ณด๋ฅผ ์ค์์๋ฒ์ ์ ์กํ๋ Wifi ํต์ 

<br>

### Web

<img src="https://img.shields.io/badge/Language-PHP-green?style=flat"/><img src="https://img.shields.io/badge/Server-AWS EC2-blue?style=flat"/><img src="https://img.shields.io/badge/DB-MySQL + AWS RDS-yellow?style=flat"/>

* ์ฐจ๋ ์ํ ์ ๋ณด๋ฅผ DB์ ์๋ก๋
* ์น ํ์ด์ง๋ฅผ ํตํ ์ฐจ๋ ์ ๋ณด ์ด๋
* ์ฃผ์ฐจ์ฅ ์ ๋ณด๋ฅผ ์์งํ๊ณ  ๊ด๋ฆฌํ๋ DB ๊ตฌ์ถ
* AWS RDS ์์ฑํ์ฌ DB ๊ตฌ์ถ
* DB ์์ ์ ๋ณด๋ฅผ ์ฌ์ฉ์์๊ฒ ์ ๊ณตํ๋ ์น ํ์ด์ง
* AWS EC2 ์ธ์คํด์ค๋ฅผ ์์ฑํ์ฌ ์๋ฒ ๊ตฌ์ถ

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

|  ๊ธฐ๋ฅ  |ํ๋ฉด|
|-------------|---------------------------|
|์ฌ์ฉ์ ๋ชจ๋|<img src=images/web_main.png  width="60%"/>|
|๊ด๋ฆฌ์ ๋ชจ๋|<img src=images/web_admin.png  width="60%"/>|



<br>

* QRCode : Linked to Web Page

<img src=images/QRCode.png  width="10%"/>

<br>

<br> -->
