class Todo:
    def __init__(self, todoNum, title) :
        self.todoNum=todoNum
        self.title=title

        #객체의 id가 같은 경우 True
    def __eq__(self,todoNum):
        if self.todoNum == todoNum:
            return True
        else:
            return False

        #객체 대표
    def __str__(self):
        return "{0}번째 TODO : {1}".format(self.todoNum, self.title)
