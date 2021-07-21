

def decorator(func):
    def decorated(input_text):
        print('함수시작!')
        func(input_text)
        print('함수끝!')
    return decorated


@decorator
def hello_world(input_text):

    print(input_text)

hello_world('Hello World')