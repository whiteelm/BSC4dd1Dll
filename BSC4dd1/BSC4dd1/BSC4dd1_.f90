    subroutine bsc4dd1(aw1, aw2, h1, h2, t, e1, e2, e3, dL, dC, Um, em, dZ0)
    !dec$ attributes stdcall, dllexport ::bsc4dd1
    !DEC$ ATTRIBUTES VALUE :: aw1, aw2, h1, h2, t, e1, e2, e3
    !DEC$ ATTRIBUTES REFERENCE :: dL, dC, Um, dZ0, em
!   BSCL (Broad-Side Coupled Line)- Связанные линии с лицевой связью 
    implicit real*8(a-b,d-h,o-v,x-y)
    dimension dL(2, 2),dC(2, 2), aa(9), Um(2, 2),dZ0(2, 2),em(2),dCC(2, 2),dLL(2, 2)
    ip = -2	   ! Индекс печати = -2,-1,0,1. Если ip=0, то всё печатаем.
    n=2
    aa(1) = 2 ! количество линий
    aa(2) = aw1 ! ширина верхней линии 
    aa(3) = aw2 ! ширина нижней линии
    aa(4) = h1 ! высота верхнего слоя (не зависит от t, отличается от AWR!)
    aa(5) = h2 ! высота нижнего слоя
    aa(6) = t ! толщина полосок (линий); нижняя полоска уходит вглубь верхнего слоя h1 
    aa(7) = e1 ! диэл.проницаем. верхнего слоя
    aa(8) = e2 ! диэл.проницаем. нижней подложки
    aa(9) = e3 ! диэл.проницаем. среды
    call main(ip,aa,dL,dC)
    dCC=dC
    dLL=dL
    call dminv(dLL,n,ad)
    call nroot(n,dCC,11.127*dLL,em,Um)
    call impedance(n,dC,Um,em,dZ0)
    end