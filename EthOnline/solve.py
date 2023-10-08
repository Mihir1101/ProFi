from pwn import * 
context.log_level = 'debug'

p = remote("chal.2023.sunshinectf.games", 23200)

p.recv()
p.sendline()


while True :
    arrows = p.recvline().decode().strip().replace('\n', '')
    new = ''
    for i in arrows :
        if i == '⇨':
            new += 'd'
        elif i == '⇦' :
            new += 'a'
        elif i == '⇩' :
            new += 's'
        elif i == '⇧' :
            new += 'w'
    p.sendline(new.encode())