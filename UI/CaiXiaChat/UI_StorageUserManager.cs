/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_StorageUserManager : GComponent
    {
        public GImage m_n0;
        public GImage m_n1;
        public GList m_UserList;
        public GLabel m_NewID;
        public GButton m_AddNewUser;
        public const string URL = "ui://gfenp5kwrnvl115";

        public static UI_StorageUserManager CreateInstance()
        {
            return (UI_StorageUserManager)UIPackage.CreateObject("CaiXiaChat", "StorageUserManager");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_UserList = (GList)GetChildAt(2);
            m_NewID = (GLabel)GetChildAt(3);
            m_AddNewUser = (GButton)GetChildAt(4);
        }
    }
}