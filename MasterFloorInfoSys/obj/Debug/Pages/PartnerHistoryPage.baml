   M S B A M L   `   `   `  ����  MasterFloorInfoSys1    +MasterFloorInfoSys.Pages.PartnerHistoryPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5        N� Title$)  #История реализации��5      .��5	      �  � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $<��6История реализации продукции��6   $��24(�5      $��Center=�5      $��	0,10,0,10q�5      �� 5   
   -   5         ��Name$ PartnersComboBox��5      $��0��5      $��10q�5       �� DisplayMemberPath$
 Name��5       �� SelectedValuePath$ ID��5      5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ 
dGridSales��5      $��1��6'      AutoGenerateColumns .  $��10q�6u   ��64   �� *SalesHistory+   Columns 5       0  *System.Windows.Controls.DataGridTextColumn  5!      ,  &System.Windows.Controls.DataGridColumn   Header$1 +Наименование продукции��6%   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 6e   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6E   �� *ProductName+6e     5"      $ Количество��6%   $
	 Auto 6V   
 69   �� *
Quantity+6V     5#      $ Дата��6%   $
	 Auto 6P   
 63   �� *
SaleDate+6P   5%      5(      5)      