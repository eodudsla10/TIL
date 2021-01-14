from exception.duplicate_exception import DuplicateException
from exception.idnotfound_exception import IDNotFoundException
from dao.file_dao import save_list, init_data_load


class TodoService:


    todolist=[]

    #등록
    def rigister(self,todo):
        index = self.is_exist(todo.todoNum)
        if index <0:
            TodoService.todolist.append(todo)
            return "{0}가 등록되었습니다.".format(todo.todoNum)
        else:
            try:
                raise DuplicateException(todo.todoNum)
            except DuplicateException as inputerror:
                return str(inputerror)

    #목록
    def getAllTOdos(self):
        return TodoService.todolist


    #수정

    def update(self,todoNum,title):
        index =self.is_exist(todoNum)
        if index > -1:
            TodoService.todolist[index].title =title
            return "{0}의 일정이 수정되었습니다.".format(todoNum)
        else:
            try:
                raise IDNotFoundException(todoNum)
            except IDNotFoundException as updateerror:
                return str(updateerror)

    def remove(self,todoNum):
        index = self.is_exist(todoNum)
        if index > -1:
            TodoService.todolist.pop(index)
            return "{0} 정보를 삭제했습니다.".format(todoNum)
        else :
            try:
               raise IDNotFoundException(todoNum) 
            except IDNotFoundException as removeError:
               return str(removeError)

    #존재여부
    def is_exist(self,todoNum):
        for index, todo in enumerate(TodoService.todolist):
            if todo.todoNum == todoNum:
                return index
        return -1

    #file read
    def file_read(self):
        TodoService.todolist = init_data_load()

    #file write
    def file_write(self):
        save_list(TodoService.todolist)


        
