/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_MsgItem : GLabel
    {
        public GRichTextField m_Sender;
        public GRichTextField m_title;
        public const string URL = "ui://gfenp5kwkddn10u";

        public static UI_MsgItem CreateInstance()
        {
            return (UI_MsgItem)UIPackage.CreateObject("CaiXiaChat", "MsgItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_Sender = (GRichTextField)GetChildAt(0);
            m_title = (GRichTextField)GetChildAt(1);
        }
    }
}