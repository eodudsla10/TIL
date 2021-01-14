from entity.todo import Todo

def menu_display():
    print("===== todo =====")
    print("1. 일정 등록")
    print("2. 목록 보기")
    print("3. 일정 수정")
    print("4. 일정 삭제")
    print("0.종료")

def menu_select():
    menu = input("메뉴를 선택하세요 :")
    return menu


#message display
def message_display(message):
    print(message)

#list display
def list_display(todolist):
    print("=====일정 목록=====")
    for todo in todolist:
        print(todo)

#todo input display
def input_display():
    todoNum = input("번호 : ")
    title = input("일정 : ")

    return Todo(todoNum,title)

#update input display

def update_display():
    todoNum = input("수정할 번호 :  ")
    title = input("수정할 일정 : ")

    return (todoNum,title)

#delete input display

def delete_display():
    todoNum = input("삭제할 번호 : ")
    return todoNum