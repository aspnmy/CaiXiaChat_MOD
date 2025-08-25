/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatListMenu : GComponent
    {
        public GImage m_n4;
        public GList m_n3;
        public const string URL = "ui://gfenp5kwvui8l2";

        public static UI_CaiXiaChatListMenu CreateInstance()
        {
            return (UI_CaiXiaChatListMenu)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatListMenu");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n4 = (GImage)GetChildAt(0);
            m_n3 = (GList)GetChildAt(1);
        }
    }
}