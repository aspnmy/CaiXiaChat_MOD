/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AdText : GLabel
    {
        public GRichTextField m_title;
        public Transition m_t1;
        public const string URL = "ui://gfenp5kwq3n09c";

        public static UI_AdText CreateInstance()
        {
            return (UI_AdText)UIPackage.CreateObject("CaiXiaChat", "AdText");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GRichTextField)GetChildAt(0);
            m_t1 = GetTransitionAt(0);
        }
    }
}