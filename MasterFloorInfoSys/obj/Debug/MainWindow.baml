   M S B A M L   `   `   `  ����M  IMasterFloorInfoSys, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MasterFloorInfoSysMasterFloorInfoSys  5   	   #    MasterFloorInfoSys.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:MasterFloorInfoSys     5   	   -   5          � Title$  
MainWindow��5   	   $	��450��5	   	   $	��800��5
   	   .��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      �� 5      $��50 �6   .+�5   
   �� -   5         ��Name$ 	btnCancel��5      $��
Назад��5      $
��Left=�5      $��5q�5      5      �� 5   
   -   5        $ btnPartnersList��5      $��Партнеры��5      $
��Left=�5      $��	200,5,5,5q�5      5      �� 5    
   -   5        $ btnPartnerHistory��5       $��История��5!      $
��Left=�5"      $��	395,5,5,5q�5#      5$       � 5&   
   -   5          �Name$ 	MainFrame��5&      $��1��5'        � Source$ Pages/AuthPage.xaml?�5(        � NavigationUIVisibility$ Hidden=�5)      5*      5,      5-      