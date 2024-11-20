include 'emu8086.inc'

org 100h

start:
    print "Input Marks (0-100): "
    call scan_num
    mov ax, cx

    printn ""
    print "Your Grade is: "

    cmp ax, 80
    ja grade_a

    cmp ax, 70
    ja grade_b

    cmp ax, 60
    ja grade_c

    jmp grade_e

grade_a:
    print "A"
    jmp stop

grade_b:
    print "B"
    jmp stop

grade_c:
    print "C"
    jmp stop

grade_e:
    print "E"
    jmp stop

stop:
    ret

define_scan_num
define_print_num
define_print_num_uns

end
