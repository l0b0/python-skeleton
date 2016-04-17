def module_function_name(function):
    return "{module}.{function}".format(module=function.__module__, function=function.__name__)
