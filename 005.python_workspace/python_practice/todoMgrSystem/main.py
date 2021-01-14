from controller.todo_controller import TodoController
from view.template_view import message_display, menu_select, menu_display
from view.template_view import input_display, update_display,delete_display

controller = TodoController()



controller.file_read()
while True:
    menu_display()

    menu = menu_select()

    if menu == "1":
        todo = input_display()
        controller.register(todo)

    elif menu == "2":
        controller.getAllTodos()

    elif menu == "3":
        todoNum,title = update_display()
        controller.update(todoNum,title)


    elif menu == "4":
        todoNum = delete_display()
        controller.remove(todoNum)
        

    elif menu == "0":
        message_display("수강생 관리 프로그램을 종료합니다.")
        controller.file_write()
        break

    else :
        print()
        message_display("1,2,3,4,0 번 중 선택하세요" )