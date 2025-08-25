/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Slider : GSlider
    {
        public GImage m_n0;
        public GImage m_bar;
        public UI_Slider_grip m_grip;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwtrnyzx";

        public static UI_Slider CreateInstance()
        {
            return (UI_Slider)UIPackage.CreateObject("CaiXiaChat", "Slider");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_bar = (GImage)GetChildAt(1);
            m_grip = (UI_Slider_grip)GetChildAt(2);
            m_title = (GTextField)GetChildAt(3);
        }
    }
}