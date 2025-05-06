<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Formations.aspx.cs" Inherits="Formations" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Employee Skills Overview</title>
    <link href="MainStyle.css" rel="stylesheet" type="text/css" />
    <style>
        .skills-container {
            font-family: 'Gugi', sans-serif;
            padding: 20px;
            background: #f5f5f5;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .skills-header {
            color: #1177D9;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }
        .skills-grid {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="skills-container">
            <div class="skills-header">Skills Overview, as of 31 March 2025</div>

            <dx:ASPxFormLayout ID="FormSkillsOverview" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
                <Items>
                    <dx:LayoutGroup ShowCaption="False" ColumnSpan="4" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <table width="100%">
                                            <tr>
                                                <td width="360px">
                                                    <table style="width: 350px; text-align: center; font-size: 14px; font-weight: 700; padding: 25px; color: #1177D9; border-radius: 5px; background-color: #f5f5f5;">
                                                        <tr>
                                                            <td height="20px" colspan="5"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="150px">Certified Employees</td>
                                                            <td width="80px">
                                                                <dx:ASPxImage ID="imgCertified" Width="32px" EmptyImage-IconID="businessobjects_bo_certificate_32x32" runat="server"></dx:ASPxImage>
                                                            </td>
                                                            <td width="5px"></td>
                                                            <td width="80px">
                                                                <dx:ASPxImage ID="imgTotal" Width="32px" EmptyImage-IconID="people_user_32x32" runat="server"></dx:ASPxImage>
                                                            </td>
                                                            <td width="10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 15px;">
                                                                <dx:ASPxLabel ID="txtCertifiedPercent" Text="%" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">
                                                                <dx:ASPxLabel ID="txtCertifiedCount" Text="" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td width="5px"></td>
                                                            <td style="height: 15px; text-align: center; font-size: 14px; font-weight: 700; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                                <dx:ASPxLabel ID="txtTotalEmployees" Text="" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td width="10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="20px" colspan="5"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="50px"></td>
                                                <td width="360px">
                                                    <table style="width: 350px; text-align: center; font-size: 14px; font-weight: 700; padding: 25px; color: #1177D9; border-radius: 5px; background-color: #f5f5f5;">
                                                        <tr>
                                                            <td colspan="5" height="20px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="150px">Average Skill Level</td>
                                                            <td width="80px">
                                                                <dx:ASPxImage ID="imgSkillMen" Width="32px" EmptyImage-IconID="people_user_32x32" runat="server"></dx:ASPxImage>
                                                            </td>
                                                            <td width="5px"></td>
                                                            <td width="80px">
                                                                <dx:ASPxImage ID="imgSkillWomen" Width="32px" EmptyImage-IconID="people_female_32x32" runat="server"></dx:ASPxImage>
                                                            </td>
                                                            <td width="10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 15px;">
                                                                <dx:ASPxLabel ID="txtAvgSkill" Text="Level" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">
                                                                <dx:ASPxLabel ID="txtAvgSkillMen" Text="" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td width="5px"></td>
                                                            <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                                <dx:ASPxLabel ID="txtAvgSkillWomen" Text="" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td width="10px"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5" height="20px"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Skill Category" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridSkillCategory" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSkillCategory" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" CssClass="skills-grid">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Skill Category" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2024" VisibleIndex="3" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2023" VisibleIndex="4" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True"></PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Certification Level" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridCertLevel" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCertLevel" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" CssClass="skills-grid">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Certification Level" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2024" VisibleIndex="3" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2023" VisibleIndex="4" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True"></PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Department" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridDepartment" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartment" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" CssClass="skills-grid">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Department" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2024" VisibleIndex="3" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2023" VisibleIndex="4" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True"></PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Experience Level" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridExperienceLevel" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridExperienceLevel" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" CssClass="skills-grid">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Experience Level" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2024" VisibleIndex="3" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Proficiency" Caption="2023" VisibleIndex="4" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True"></PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </div>
    </form>
</body>
</html>