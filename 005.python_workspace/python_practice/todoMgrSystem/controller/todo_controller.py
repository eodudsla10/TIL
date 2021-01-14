from service.todo_service import TodoService
from view.template_view import message_display,list_display

class TodoController :
    
    def register(self, todo):
        service = TodoService()
        message = service.rigister(todo)
        message_display(message)

    def getAllTodos(self):
        service  = TodoService()
        todolist = service.getAllTOdos()
        list_display(todolist)

    def update(self, todoNum, title):
        if todoNum =="" or title=="":
            message_display("번호와 일정 데이터 값이 필요합니다.")
        service =TodoService()
        message = service.update(todoNum,title)
        message_display(message)

    def remove(self,todoNum):
        if todoNum == "":
            message_display("번호 값이 필요합니다.")
        service = TodoService()
        message =service.remove(todoNum)
        message_display(message)

    def file_read(self):
        service = TodoService()
        service.file_read

    def file_write(self):
        service =TodoService()
        service.file_write()

