%% Weyl-Heisenberg Bases Toolbox
% Script "comparison.m"
%% ��������:
% ��������� ��������� ���� ������ ����������� ������� �����-�����������:
% 1) ��������������� � �������������� ������������� ����������,
% 2) ��������������� � �������������� �������� ���������.
%
%% ����������:
% ������ ���������� ����� ���������� ����� �������� ������ � 
% �� ��������� � ������������ ������������ (�� ��������� eps = 1e-64).
%
%% ���� ������
M     = input('���������� ������� �� ������� M = ');
L     = input('���������� ������� �� ������� L = ');
a     = input('�������� ����� a = ');
sigma = input('�������������������� ���������� sigma = ');

%% ���������� ������� ������������ ������ �����-����������� � �������������� ������������� ����������
tic;
W = weylhz(M, L, a, sigma);
disp('����� ������� ������ � �������������� ������������� ����������:')
toc;

%% ���������� ������� ������������ ������ �����-����������� � �������������� �������� ���������
tic;
Wp = weylhzp(M, L, a, sigma);
disp('����� ������� ������ � �������������� ����������� ����������:')
toc;

%% ������ ������������ ������
A = norm(W - Wp); % ����� �������� ������ �-�,
eps = 1e-8; % ����������� ������.

if (A < eps)
    disp('������� ���������!');
else
    disp('������� ��������� � ������������:')
    disp(A);
end