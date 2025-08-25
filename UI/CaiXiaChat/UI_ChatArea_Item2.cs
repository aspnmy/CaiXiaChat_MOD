/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ChatArea_Item2 : GLabel
    {
        public GRichTextField m_SenderName;
        public GRichTextField m_text;
        public const string URL = "ui://gfenp5kwdbdtzm";

        public static UI_ChatArea_Item2 CreateInstance()
        {
            return (UI_ChatArea_Item2)UIPackage.CreateObject("CaiXiaChat", "ChatArea_Item2");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_SenderName = (GRichTextField)GetChildAt(0);
            m_text = (GRichTextField)GetChildAt(1);
        }
    }
}