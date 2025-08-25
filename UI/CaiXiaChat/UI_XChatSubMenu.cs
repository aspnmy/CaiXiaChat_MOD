/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatSubMenu : GComponent
    {
        public GImage m_n4;
        public GList m_n3;
        public const string URL = "ui://gfenp5kwtrnyzs";

        public static UI_CaiXiaChatSubMenu CreateInstance()
        {
            return (UI_CaiXiaChatSubMenu)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatSubMenu");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n4 = (GImage)GetChildAt(0);
            m_n3 = (GList)GetChildAt(1);
        }
    }
}