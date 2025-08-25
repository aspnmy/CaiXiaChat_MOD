/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatOpenRedPocketWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n3;
        public GList m_n2;
        public GTextField m_n5;
        public GTextField m_n6;
        public const string URL = "ui://gfenp5kwvui8kz";

        public static UI_CaiXiaChatOpenRedPocketWindow CreateInstance()
        {
            return (UI_CaiXiaChatOpenRedPocketWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatOpenRedPocketWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n3 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
            m_n5 = (GTextField)GetChildAt(3);
            m_n6 = (GTextField)GetChildAt(4);
        }
    }
}