/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_WindowFrame : GLabel
    {
        public GImage m_n7;
        public GGraph m_dragArea;
        public GGraph m_contentArea;
        public GButton m_n5;
        public GImage m_n6;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwtulk114";

        public static UI_WindowFrame CreateInstance()
        {
            return (UI_WindowFrame)UIPackage.CreateObject("CaiXiaChat", "WindowFrame");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n7 = (GImage)GetChildAt(0);
            m_dragArea = (GGraph)GetChildAt(1);
            m_contentArea = (GGraph)GetChildAt(2);
            m_n5 = (GButton)GetChildAt(3);
            m_n6 = (GImage)GetChildAt(4);
            m_title = (GTextField)GetChildAt(5);
        }
    }
}