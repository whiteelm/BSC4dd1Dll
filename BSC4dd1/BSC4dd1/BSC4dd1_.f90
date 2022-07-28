    subroutine bsc4dd1(aw1, aw2, h1, h2, t, e1, e2, e3, dL, dC, Um, em, dZ0)
    !dec$ attributes stdcall, dllexport ::bsc4dd1
    !DEC$ ATTRIBUTES VALUE :: aw1, aw2, h1, h2, t, e1, e2, e3
    !DEC$ ATTRIBUTES REFERENCE :: dL, dC, Um, dZ0, em
!   BSCL (Broad-Side Coupled Line)- ��������� ����� � ������� ������ 
    implicit real*8(a-b,d-h,o-v,x-y)
    dimension dL(2, 2),dC(2, 2), aa(9), Um(2, 2),dZ0(2, 2),em(2),dCC(2, 2),dLL(2, 2)
    ip = -2	   ! ������ ������ = -2,-1,0,1. ���� ip=0, �� �� ��������.
    n=2
    aa(1) = 2 ! ���������� �����
    aa(2) = aw1 ! ������ ������� ����� 
    aa(3) = aw2 ! ������ ������ �����
    aa(4) = h1 ! ������ �������� ���� (�� ������� �� t, ���������� �� AWR!)
    aa(5) = h2 ! ������ ������� ����
    aa(6) = t ! ������� ������� (�����); ������ ������� ������ ������ �������� ���� h1 
    aa(7) = e1 ! ����.���������. �������� ����
    aa(8) = e2 ! ����.���������. ������ ��������
    aa(9) = e3 ! ����.���������. �����
    call main(ip,aa,dL,dC)
    dCC=dC
    dLL=dL
    call dminv(dLL,n,ad)
    call nroot(n,dCC,11.127*dLL,em,Um)
    call impedance(n,dC,Um,em,dZ0)
    end