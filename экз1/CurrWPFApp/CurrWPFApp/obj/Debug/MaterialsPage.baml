   M S B A M L   `   `   `  ����E  ACurrWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:CurrWPFApp
CurrWPFApp  5          CurrWPFApp.MaterialsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      *localclr-namespace:CurrWPFApp     5      -   5          N� Title$  MaterialsPage��5	      .��5      � 
������� � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��60 �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ DGridMaterials��5      $	��900��6+      AutoGenerateColumns .     
IsReadOnly .    	RowHeight$	 120Q�6e      CanUserResizeRows .   � 	Resources 5      )  #System.Windows.Controls.DataGridRow �� 
TargetType	 �� Property
 �� Value��%~   '        �� 5      "  6   .�5      �� 	 � ��$
 0 0 0 10q�6/   �� 5      	 � ��

 ���� 63   5      5         Columns 5      4  .System.Windows.Controls.DataGridTemplateColumn  5         CellTemplate 5      �� 5      .R�5      � $
��auto��6#   $��15q�60    � ColumnDefinitions 5   "   �� 5   &   $��* �67   �� 5   &   $	��280 �67   .+�5"   "   �� $��0��6-   .+�5#   &   �� $��18(�60   �� 5$      �6   �� *MaterialType1+ �� 5%      $	� | ��6    �� 5&      �6   �� *MaterialName+5'   '   �� 5(   &   $��14(�60   �� 5)      $�Мин. Кол-во: ��6    �� 5*      �6   �� *MinQuantity+5+   '   �� 5,   &   $��14(�60   �� 5-      $"�Есть на складе: ��6    �� 5.      �6   �� *HasQuantity+5/   '   �� 50   &   $��14(�60   �� 51      $�
Цена: ��6    �� 52      �6   �� *
PriceByOne+ �� 53      $
� р/��6    �� 54      �6   �� *
CheckStyle+ �� 55      $*�$ | Кол-во в упаковке: ��6    �� 56      �6   �� *QuantityInOne+57   '   58   #   �� 59   "   $��NeedQuantity��6x   $��Right=�6,   $��20 0 0 0q�6H   $��18(�6Z   $��1��6h   ��5:      �� *NeedQuantity+ �� StringFormat$  Требуется: {0:N2}���� 5=   "   $��1��6-   $��0 40 0 0q�6=    �� Orientation$ 
Horizontal=�6O   .+�5>   &   �� $��BtnEdit��6<   -   5        $
��Edit��5>   -   $	��120��6a   �� 5?   &   $��BtnMore��6<   -   5        $
��More��5?   -   $	��120��6a   5@   #   5A      5C      5E      5G      �� 5I   
   $��1��6   ���#BFD6F6���	#FF405C7360   �� 5J   
   -   5        $��BtnAdd��5J      $��1��6   $
��Left=�6A   $'��!Добавить материал��6\   $��20 0 0 0q�6x   $	��170��6�   �� 5K   
   -   5        $��	BtnDelete��5K      $��1��6   $��Right=�6G   $)��#Удалить материал(ы)��6c   $��0 0 20 0q�6�   $	��170��6�   5L      5M      