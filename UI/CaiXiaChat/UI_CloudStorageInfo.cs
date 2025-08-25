/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CloudStorageInfo : GComponent
    {
        public UI_WindowFrame m_frame;
        public GTextField m_n1;
        public GTextField m_n2;
        public GTextField m_n3;
        public GTextField m_n4;
        public GTextField m_n5;
        public UI_Button m_Submit;
        public GLabel m_n9;
        public GTextField m_Sizes;
        public GTextField m_n11;
        public GLabel m_n16;
        public UI_Button m_AddSize;
        public UI_Button m_UserManagerBtn;
        public GTextField m_Users;
        public UI_StorageUserManager m_UserManager;
        public GTextField m_n20;
        public GTextField m_n21;
        public GLabel m_n25;
        public GLabel m_n26;
        public GRichTextField m_n27;
        public GTextField m_n28;
        public GTextField m_n29;
        public const string URL = "ui://gfenp5kwh8fo110";

        public static UI_CloudStorageInfo CreateInstance()
        {
            return (UI_CloudStorageInfo)UIPackage.CreateObject("CaiXiaChat", "CloudStorageInfo");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (UI_WindowFrame)GetChildAt(0);
            m_n1 = (GTextField)GetChildAt(1);
            m_n2 = (GTextField)GetChildAt(2);
            m_n3 = (GTextField)GetChildAt(3);
            m_n4 = (GTextField)GetChildAt(4);
            m_n5 = (GTextField)GetChildAt(5);
            m_Submit = (UI_Button)GetChildAt(6);
            m_n9 = (GLabel)GetChildAt(7);
            m_Sizes = (GTextField)GetChildAt(8);
            m_n11 = (GTextField)GetChildAt(9);
            m_n16 = (GLabel)GetChildAt(10);
            m_AddSize = (UI_Button)GetChildAt(11);
            m_UserManagerBtn = (UI_Button)GetChildAt(12);
            m_Users = (GTextField)GetChildAt(13);
            m_UserManager = (UI_StorageUserManager)GetChildAt(14);
            m_n20 = (GTextField)GetChildAt(15);
            m_n21 = (GTextField)GetChildAt(16);
            m_n25 = (GLabel)GetChildAt(17);
            m_n26 = (GLabel)GetChildAt(18);
            m_n27 = (GRichTextField)GetChildAt(19);
            m_n28 = (GTextField)GetChildAt(20);
            m_n29 = (GTextField)GetChildAt(21);
        }
    }
}