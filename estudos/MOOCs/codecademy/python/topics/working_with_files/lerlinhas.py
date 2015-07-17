my_file = open("text.txt","r")
print my_file.readline()
print my_file.readline()
print my_file.readline()

my_file.close()


with open("text.txt","w") as my_file:
    my_file.write("Escrevendo no arquivo sem precisar chamar close")
    
if not (my_file.closed):
    my_file.close()
print my_file.closed