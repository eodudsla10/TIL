# 00.Basic CLI

1.`ls` : 목록조회(list)

```
00_basic_cli.md  a.txt  b/  c.txt  d.txt  e.txt  images/  markdown.md
```

​	`ls -al` : 상세 목록 조회

```
total 25
drwxr-xr-x 1 전대영 197121   0 Dec 29 15:05 ./
drwxr-xr-x 1 전대영 197121   0 Dec 29 13:30 ../
drwxr-xr-x 1 전대영 197121   0 Dec 29 14:03 .git/
-rw-r--r-- 1 전대영 197121   0 Dec 29 15:05 00_basic_cli.md
-rw-r--r-- 1 전대영 197121   0 Dec 29 11:26 a.txt
drwxr-xr-x 1 전대영 197121   0 Dec 29 11:32 b/
-rw-r--r-- 1 전대영 197121   0 Dec 29 11:32 c.txt
-rw-r--r-- 1 전대영 197121   0 Dec 29 13:45 d.txt
-rw-r--r-- 1 전대영 197121   0 Dec 29 13:45 e.txt
drwxr-xr-x 1 전대영 197121   0 Dec 29 14:37 images/
-rw-r--r-- 1 전대영 197121 644 Dec 29 15:04 markdown.md

```

2. `cd` : 폴더 변경(change directory)

   1.`cd` : `~` 폴더(home 폴더)로 이동

   2.`cd 폴더명` : `폴더명` 으로 이동

   ​	1. `cd폴더명/폴더명/폴더명` : 여러개의 폴더 한번에 이동

   3.`cd ..` : 상위 폴더로 이동

3. `mkdir`: 폴더 생성(make directory)

   1.`mkdir 폴더명` : `A` 이라는 이름의 폴더를 생성

4. `touch`: 파일 생성
   1. `touch A.txt`: `A.txt` 파일을 생성(빈 파일)

5. `cp` : 파일/폴더 복사
   1. `cp A B`: A라는 파일/폴더를복사하여 B를 생성

6. `mv` : 파일/폴더 이동
   1. `mv A.txt B/A.txt`: `A.txt` 파일을 B 폴더 안으로 이동
   2. `mv A.txt C.txt`: `A.txt` 파일의 이름을 `C.txt`로 변경

7. Tab: 자동완성
8. 방향키 위,아래 : 명령어 기록(History)