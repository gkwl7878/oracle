/*
���)
 880101-1234567 �� 
    ****** - *******
  234567 892345 �� ���ؼ� ���� ���� �� ���ؼ� 11�� �ٴ� �������� ���ϱ�
���� ����� 11���� ����
�� ���� 10���� ���� ������ ���ϱ� => �ֹι�ȣ�� ���ڸ��� ������ ��, ������ ��ȿ, ���������� ��ȿ
�Է°�: ssn
*/

create or replace function  valid_ssn1(ssn char) return varchar2
is
 	result_msg varchar2(6) := '��ȿ'; 
 	temp_val number :=0; --�������� ������ ����
 	flag_num char(1); -- �ֹι�ȣ�� ���ڸ�
 	idx number :=2; 
 	temp_ssn varchar2(13);

begin
    
    if check_ssn(ssn) = 'success' then 
    	temp_ssn :=substr(ssn,1,6)||substr(ssn,8,6);
    	flag_num := substr(ssn,14,1);
    	--temp_ssn 880101123456
    	for i in 1.. length(temp_ssn)loop
    		temp_val:=temp_val+ substr(temp_ssn,i,1)*idx;  
    		
    		idx:=idx+1;
    		if idx = 10 then
    			idx:=2;
    		end if;
    	end loop;
    	
    		temp_val:=mod(11-mod(temp_val,11),10);
    		if temp_val =  flag_num then
    		result_msg:='��ȿ';
    		end if;
    end if;
     
	return result_msg;
end;
/