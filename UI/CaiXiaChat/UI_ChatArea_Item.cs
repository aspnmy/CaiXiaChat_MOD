/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ChatArea_Item : GLabel
    {
        public GRichTextField m_Sender;
        public GRichTextField m_title;
        public const string URL = "ui://gfenp5kwdbdtzl";

        public static UI_ChatArea_Item CreateInstance()
        {
            return (UI_ChatArea_Item)UIPackage.CreateObject("CaiXiaChat", "ChatArea_Item");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_Sender = (GRichTextField)GetChildAt(0);
            m_title = (GRichTextField)GetChildAt(1);
        }
    }
}