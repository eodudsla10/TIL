# 파이썬 실습
todo=[]
todoNum=1

while True:
    print("===== todo =====")
    print("1. 일정 등록")
    print("2. 목록 보기")
    print("3. 일정 수정")
    print("4. 일정 삭제")
    print("0.종료")
    menu =input("메뉴를 선택하세요 : ")
    if menu == "1":
        title =input("일정 : ")
        todolist = {"todoNum": todoNum, "title":title}
        todo.append(todolist)
        print("{0}(이)가 등록되었습니다.".format(title))
        todoNum += 1

    elif menu == "2":
        print("=====목록 보기====")
        print(todo)

    elif menu == "3":
        todoNum = input("수정할 일정 번호")
        while not todoNum.isdecimal():
            print("일정 번호를 숫자로 입력해 주세요 :")
            todoNum = input("수정할 일정 번호 : ")
        title = input("수정할 일정 내용 : ")
        for todolist in todo:
            if todolist["todoNum"] == int(todoNum):
                todolist["title"] = title
                print("{0}의 전공정보가 수정되었습니다.".format(todolist["title"]))
                break

    elif menu == "4":
        todoNum = input("삭제할 일정번호 :")
        while not todoNum.isdecimal():
            print("일정 번호를 숫자로 입력해 주세요")
            todoNum=input("삭제할 일정 번호 :")
        for todolist in todo:
            if todolist["todoNum"] == int(todoNum):
                delete = input("{0}의 정보를 삭제하시겠습니까?[y/n]".format(todolist["title"]))
                if delete == 'y' or delete == 'Y':
                    todo.remove(todolist)
                    print("{0}의 정보가 삭제되었습니다.".format(todoNum))
                    break

    elif menu == "0":
        print("실행을 종료합니다.")
        break

    else :
        print()
        print("1,2,3,4,0 번 중 선택하세요" )



