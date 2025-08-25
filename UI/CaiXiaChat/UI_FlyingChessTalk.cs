/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_FlyingChessTalk : GComponent
    {
        public GImage m_n0;
        public GImage m_n1;
        public GList m_n2;
        public const string URL = "ui://gfenp5kwkddn10s";

        public static UI_FlyingChessTalk CreateInstance()
        {
            return (UI_FlyingChessTalk)UIPackage.CreateObject("CaiXiaChat", "FlyingChessTalk");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
        }
    }
}