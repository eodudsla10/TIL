# 04. PUSH ERROR

##  Pull을 빠뜨린 경우

- e를 commit 합니다

- 그리고, push

  ```bash
  $ git push origin main
  To https://github.com/eodudsla10/TIL-test.git
   ! [rejected]        main -> main (fetch first)
  error: failed to push some refs to
  'https://github.com/eodudsla10/TIL-test.git'
  # push 실패
  hint: Updates were rejected because the remote contains work that you do
  # 업데이트가 실패했는데, remote가 니가 local에 가지고 있지 않은 작업을 들고 있다.
  hint: not have locally. This is usually caused by another repository pushing
  # 지금 같은 경우는 다른 Repo로 push 하려고 시도한 것이나
  hint: to the same ref. You may want to first integrate the remote changes
  # push를 다시 하기 전에 remote에서 발생한 변경 사항을 먼저 통합(반영)을 할 수 있다. 
  hint: (e.g., 'git pull ...') before pushing again.
  hint: See the 'Note about fast-forwards' in 'git push --help'
  for details.
  ```

- `git pull origin main`

  ```bash
  Merge branch 'main' of https://github.com/eodudsla10/TIL-test #<- 이미 메세지가 작성되어 있다.
  # Please enter a commit message to explain why this merge is necessary,
  # especially if it merges an updated upstream into a topic branch.
  #
  # Lines starting with '#' will be ignored, and an empty message aborts
  # the commit.
  
  ```

  - vim : 에디터

    - esc
    - :
    - wq (write,저장) (quit, 종료)

  - enter

    ```bash
    $ git pull origin main
    From https://github.com/eodudsla10/TIL-test
     * branch            main       -> FETCH_HEAD
       07dad38..123b248  main       -> origin/main
    Merge made by the 'recursive' strategy.
    # Merge가 만들어졌다.
     d.txt | 0
     1 file changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 d.txt
    
    ```

    