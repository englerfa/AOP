import main
import datetime
import inspect      #module with information about about objects such as functions


old_func = main.A.func          # need to store the old function before - otherwise endless recursion
def monkey_func(self):
    # call original function
    old_func(self)

    # extend original function
    frame               = inspect.currentframe()
    function_name       = inspect.getframeinfo(frame)[2]
    args, _, _, values  = inspect.getargvalues(frame)

    print(datetime.datetime.now(), function_name , end="")
    for i in args:
        print(" %s = %s" %(i, values[i]), end="")
    print()

old_add_numbers = main.A.add_numbers
def monkey_add_numbers(self, first, second):
    # call original function
    old_add_numbers(self, first, second)

    # extend original function
    frame = inspect.currentframe()
    function_name = inspect.getframeinfo(frame)[2]
    args, _, _, values = inspect.getargvalues(frame)

    print(datetime.datetime.now(), function_name, end="")
    for i in args:
        print(" %s = %s" % (i, values[i]), end="")
    print()


# replacing address
main.A.func         = monkey_func
main.A.add_numbers  = monkey_add_numbers




# create an instance and call functions
obj = main.A()
obj.func()
obj.add_numbers(1,4)
