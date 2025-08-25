/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ChatArea : GLabel
    {
        public GRichTextField m_title;
        public const string URL = "ui://gfenp5kwgj3ie";

        public static UI_ChatArea CreateInstance()
        {
            return (UI_ChatArea)UIPackage.CreateObject("CaiXiaChat", "ChatArea");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GRichTextField)GetChildAt(0);
        }
    }
}