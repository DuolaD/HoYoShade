namespace launcher.View
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            TitleBar = new ReaLTaiizor.Forms.HopeForm();
            BtnSettings = new ReaLTaiizor.Controls.LostButton();
            BtnMinimize = new ReaLTaiizor.Controls.LostButton();
            BtnExit = new ReaLTaiizor.Controls.LostButton();
            TitleBar.SuspendLayout();
            SuspendLayout();
            // 
            // TitleBar
            // 
            TitleBar.ControlBox = false;
            TitleBar.ControlBoxColorH = Color.FromArgb(228, 231, 237);
            TitleBar.ControlBoxColorHC = Color.FromArgb(245, 108, 108);
            TitleBar.ControlBoxColorN = Color.White;
            TitleBar.Controls.Add(BtnSettings);
            TitleBar.Controls.Add(BtnMinimize);
            TitleBar.Controls.Add(BtnExit);
            resources.ApplyResources(TitleBar, "TitleBar");
            TitleBar.ForeColor = Color.FromArgb(242, 246, 252);
            TitleBar.Image = null;
            TitleBar.Name = "TitleBar";
            TitleBar.ThemeColor = Color.FromArgb(20, 20, 20);
            // 
            // BtnSettings
            // 
            BtnSettings.BackColor = Color.FromArgb(20, 20, 20);
            resources.ApplyResources(BtnSettings, "BtnSettings");
            BtnSettings.ForeColor = Color.White;
            BtnSettings.HoverColor = Color.FromArgb(53, 53, 53);
            BtnSettings.Image = (Image)resources.GetObject("BtnSettings.Image");
            BtnSettings.Name = "BtnSettings";
            // 
            // BtnMinimize
            // 
            BtnMinimize.BackColor = Color.FromArgb(20, 20, 20);
            resources.ApplyResources(BtnMinimize, "BtnMinimize");
            BtnMinimize.ForeColor = Color.White;
            BtnMinimize.HoverColor = Color.FromArgb(53, 53, 53);
            BtnMinimize.Image = (Image)resources.GetObject("BtnMinimize.Image");
            BtnMinimize.Name = "BtnMinimize";
            // 
            // BtnExit
            // 
            BtnExit.BackColor = Color.FromArgb(20, 20, 20);
            resources.ApplyResources(BtnExit, "BtnExit");
            BtnExit.ForeColor = Color.White;
            BtnExit.HoverColor = Color.FromArgb(245, 91, 49);
            BtnExit.Image = (Image)resources.GetObject("BtnExit.Image");
            BtnExit.Name = "BtnExit";
            // 
            // MainForm
            // 
            resources.ApplyResources(this, "$this");
            AutoScaleMode = AutoScaleMode.Font;
            ControlBox = false;
            Controls.Add(TitleBar);
            FormBorderStyle = FormBorderStyle.None;
            Name = "MainForm";
            TitleBar.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion

        private ReaLTaiizor.Forms.HopeForm TitleBar;
        private ReaLTaiizor.Controls.LostButton BtnExit;
        private ReaLTaiizor.Controls.LostButton BtnMinimize;
        private ReaLTaiizor.Controls.LostButton BtnSettings;
    }
}