# 신호등

# 목표
(1) NS 도로가 교통 흐름이 많은 주도로이므로 EW방향 차량이 없을 때는 녹색신호등은 항상 ON이 되어야 한다.

(2) EW도로의 양쪽 어디에서든지 차량이 들어오면 그때는 신호가 바뀐다. 그리고 NS도로나 EW도로에 차량이 있으면 신호가 계속 바뀌어야 한다. NS 녹색 신호등은 7초 동안 진행되며, 2초간 황색 신호를 준 후 적색 신호로 바뀐다. EW 녹색 신호등은 4초 동안 지속된 후 2초간 황색 신호를 준 후 적색으로 바뀐다. 이것은 NS와 EW방향 모두에 차량이 있을 경우이다.

# 1. 신호 변경

<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200814293-4da81231-4513-4591-a918-fe1c6d9d6d25.png" width="800" height="400" align='center'></td>
  </tr>
</table>


<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200814415-cb7e5dcd-a57a-4c43-971b-f01b1f271692.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200814426-c8f831c4-27cf-4e4d-9e82-37662157e81d.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200814424-90bf30c0-0da2-4654-a6b4-b30e942729be.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815222-68891b1d-cfac-4ebf-97ae-65c833ab3e6f.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815226-21c66d01-4782-445c-82c4-af31bffba9ea.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<br>

- (1) 주어진 문제에 대한 상태도
- (2) 무어머신으로 작성한 상태 다이어 그램
- (3) 다음 상태에 대한 전이표 정의
- (4) 각 상태에 비트 할당
- (5) D플립플롭으로 정의한 여기표&전이표
- (6) D플립플롭 카르노맵
Da = ~XQa+~QbQa+~QaQbX&nbspDb = ~XQb+~QbX

<br>


# 2. Counter 설계

<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815213-15b68e86-b625-4652-b477-178d7e08f42d.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815229-4de45323-a019-4ca6-a7bc-f8cc879ce360.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815235-9cfc8e27-1408-4610-9cb8-632262c6488c.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815241-6b70dd6b-fef0-428a-9873-585640f682b0.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<br>

- (1) Mod16 카운터 전이표
- (2) JK플립플롭 여기표&전이표
- (3), (4) JK플립플롭 카르노맵
Ja=BCD  &nbsp  Jb=CD     &nbsp   Jc=D        &nbsp   Jd=1
Ka=0    &nbsp  Kb=~ACD   &nbsp   Kc=~BD+~AD  &nbsp   Kd=~A+~B+~D
  
<br>
  
# 3. 스위치 연결
- 방금 만들어본 Mod-16 Counter는 JK플립플롭의 출력이 1111의 결과가 나오면 그 즉시 Reset을 시키는 형식으로 구성되어 있어서 모든 신호등의 불이 한 주기를 완료했을 때  다시 처음으로 돌아가서 반복시키는 역할을 한다. 그리고 추가적인 조건이 있는데 EW도로에 차량이 없으면 NS도로에 녹색불과 EW도로에 적색불이 계속해서 켜진다는 것이다. 그 말은 즉, 신호등의 불을 다시 Reset시킬 필요없이 계속 그 상태를 유지하면 된다는 뜻이다. 결국에는 JK플립플롭 각 결과값을 받아 초기화 시킬 수 있는 A·B·C·D에 도로에 차량이 있는지를 판별하는 스위치를 연결하면 된다.
-  ~(ABCD * EW)

# 4. JK플립플롭 Counter와 D플립플롭 연결
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815907-2106800c-8b18-4cda-95ac-aad60e506d37.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815887-73cec114-2f5b-48de-bf9b-27a04dbb475d.png" width="400" height="200" align='center'></td>
  </tr>
</table>
<br>

- (1) Mod16 카운터 전이표에서 7, 9, 13, 15초 일때 변화

- (2) 최종 카르노맵 : X=~(CD)A+~DBC

<br>

# 5. LogicWorks
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815893-5255dfaa-4854-4985-840b-a6ddbd08b6fa.png" width="800" height="400" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815897-f9f18652-b478-41e9-b07a-dce196cc089e.png" width="800" height="300" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815902-9a6bcce8-5899-4854-8af7-16397331c97a.png" width="800" height="300" align='center'></td>
  </tr>
</table>
<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200815906-3ca3ec10-66c7-44bf-8858-1feb8e76c73d.png" width="800" height="300" align='center'></td>
  </tr>
</table>

<table>
  <tr>
    <td align="center"><img src="https://user-images.githubusercontent.com/78483046/200825625-73685a55-c9ef-411b-bd7a-3ada1f95e13e.png" width="800" height="400" align='center'></td>
  </tr>
</table>

- (1)~(4) 회로도와 출력 결과
- (5) tinkercad로 구현




