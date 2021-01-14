import os.path
from entity.todo import Todo

#프로그램 종료시파일 저장
def save_list(todolist):
    with open("todos.dat", "w", encoding="utf-8") as save_file:
        for index, todo in enumerate(todolist):
            save_file.write("{0}번째 |{1},{2}\n ".format(index,todo.todoNum, todo.title))

    save_file.close()

#프로그램 시작시 파일이 존재하고 정보가 있는 경우 list todo 초기화
def init_data_load() :
    todolist=[]
    fileExist = os.path.isfile("todos.dat")
    if fileExist:
        read_file = open("todo.dat", "r")
        while True:
            data = read_file.readline()
            if len( data.split("|") )==2 :
                todo = data.split("|")[1].strip("\n").split(",")
                todolist.append(Todo(todo[0].strip(), todo[1].strip()))
            if not data:
                break
        read_file.close()
    return todolist