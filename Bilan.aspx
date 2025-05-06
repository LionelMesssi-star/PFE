<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bilan.aspx.cs" Inherits="Bilan" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Bilan Créatif</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* Styles globaux */
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        /* Conteneur principal */
        .bilan-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            background: linear-gradient(135deg, #ffffff, #f9f9f9);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Sections (Sexe, Département, Fonction) */
        .bilan-section {
            flex: 1 1 300px;
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .bilan-section:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            }

        /* Titres de section */
        .section-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        /* Éléments individuels */
        .bilan-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

            .bilan-item:hover {
                background-color: #f1f1f1;
            }

        /* Icônes */
        .bilan-image {
            font-size: 20px;
            color: #007bff;
        }

        /* Labels */
        .label {
            font-size: 16px;
            font-weight: bold;
            color: #555;
        }

        /* Section Date */
        .bilan-container4 {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
        }

        .year-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

            .year-item:last-child {
                border-bottom: none;
            }

        .year-label {
            font-weight: bold;
            color: #333;
        }

        /* Styles pour les tableaux */
        .grid-container {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .grid-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

            .grid-title i {
                font-size: 1.2em;
            }

        .top-salaire {
            color: #28a745; /* Vert pour le top salaire */
        }

        .bas-salaire {
            color: #dc3545; /* Rouge pour le plus bas salaire */
        }

        .grid-wrapper {
            flex: 1 1 48%;
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .grid-wrapper:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bilan-container">
            <!-- Partie Sexe -->
            <div class="bilan-section">
                <div class="section-title">Sexe</div>
                <div class="bilan-item">
                    <i class="fas fa-male bilan-image"></i>
                    <dx:ASPxLabel ID="Txtnbr" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-female bilan-image"></i>
                    <dx:ASPxLabel ID="TxtnbrF" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
            </div>

            <!-- Partie Département -->
            <div class="bilan-section">
                <div class="section-title">Département</div>
                <div class="bilan-item">
                    <i class="fas fa-laptop bilan-image"></i>
                    <dx:ASPxLabel ID="Txtinfo" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-users bilan-image"></i>
                    <dx:ASPxLabel ID="TxtRH" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-cogs bilan-image"></i>
                    <dx:ASPxLabel ID="TxtMec" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-bolt bilan-image"></i>
                    <dx:ASPxLabel ID="TxtElec" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
            </div>

            <!-- Partie Fonction -->
            <div class="bilan-section">
                <div class="section-title">Fonction</div>
                <div class="bilan-item">
                    <i class="fas fa-user-tie bilan-image"></i>
                    <dx:ASPxLabel ID="TxtIng" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-project-diagram bilan-image"></i>
                    <dx:ASPxLabel ID="TxtProj" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
                <div class="bilan-item">
                    <i class="fas fa-briefcase bilan-image"></i>
                    <dx:ASPxLabel ID="TxtCad" runat="server" CssClass="label"></dx:ASPxLabel>
                </div>
            </div>
        </div>

        <!-- Section Date -->
        <div class="bilan-container4">
            <div class="bilan-section4">
                <div class="section-title">Date Depart</div>
                <div class="bilan-item4">
                    <div class="year-item">
                        <span class="year-label">Année 2023 :</span>
                        <dx:ASPxLabel ID="TxtDateD" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                    <div class="year-item">
                        <span class="year-label">Année 2024 :</span>
                        <dx:ASPxLabel ID="TxtDateDD" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                    <div class="year-item">
                        <span class="year-label">Année 2025 :</span>
                        <dx:ASPxLabel ID="TxtDateDDD" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                </div>
            </div>

            <div class="bilan-section4">
                <div class="section-title">Date Embauche</div>
                <div class="bilan-item4">
                    <div class="year-item">
                        <span class="year-label">Année 2023 :</span>
                        <dx:ASPxLabel ID="TxtDateE" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                    <div class="year-item">
                        <span class="year-label">Année 2024 :</span>
                        <dx:ASPxLabel ID="TxtDateEE" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                    <div class="year-item">
                        <span class="year-label">Année 2025 :</span>
                        <dx:ASPxLabel ID="TxtDateEEE" runat="server" CssClass="label"></dx:ASPxLabel>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tableaux de salaire -->
        <div class="grid-container">
            <div>
            <div class="grid-wrapper">
                <div class="grid-title top-salaire">
                    <i class="fas fa-arrow-up"></i>
                    Top Salaires
                </div>
                <dx:ASPxGridView ID="GridCl" runat="server" DataSourceID="SqlBilan" Width="100%" Theme="Office365" KeyFieldName="ID">
                    <Columns>
                        <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                        </dx:GridViewDataComboBoxColumn>
                        
                        <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                            <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                        <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                        <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
</div>
            <div>
            <div class="grid-wrapper">
                <div class="grid-title bas-salaire">
                    <i class="fas fa-arrow-down"></i>
                    Plus Bas Salaires
                </div>
                <dx:ASPxGridView ID="GridCL1" runat="server" DataSourceID="SqlSal" Width="100%" Theme="Office365" KeyFieldName="ID">
                    <Columns>
                        <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                        </dx:GridViewDataComboBoxColumn>
                        
                        <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                            <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                        <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                        <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                    </Columns>
                </dx:ASPxGridView>
            </div>
                </div>
        </div>
        <div class="grid-container">
            <div>
                <div class="grid-wrapper">
                    <div class="grid-title top-salaire">
                        <i class="fas fa-arrow-up"></i>
                        Top Salaires Homme
                    </div>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlSalH" Width="100%" Theme="Office365" KeyFieldName="ID">
                        <Columns>
                            <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="ID_Sexe" Caption="Sexe">
                                <PropertiesComboBox DataSourceID="SqlGender" TextField="Description" ValueField="ID" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                                <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                            <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                            <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <div class="grid-wrapper">
                        <div class="grid-title bas-salaire">
                            <i class="fas fa-arrow-down"></i>
                            Plus Bas Salaires Homme
                        </div>
                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" DataSourceID="SqlSalHA" Width="100%" Theme="Office365" KeyFieldName="ID">
                            <Columns>
                                <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="ID_Sexe" Caption="Sexe">
                                    <PropertiesComboBox DataSourceID="SqlGender" TextField="Description" ValueField="ID" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                                    <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                                <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                                <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </div>
                </div>
            </div>
            <div>

                <div class="grid-wrapper">
                    <div class="grid-title top-salaire">
                        <i class="fas fa-arrow-up"></i>
                        Top Salaires Femme
                    </div>
                    <dx:ASPxGridView ID="ASPxGridView4" runat="server" DataSourceID="SqlSalFA" Width="100%" Theme="Office365" KeyFieldName="ID">
                        <Columns>
                            <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="ID_Sexe" Caption="Sexe">
                                <PropertiesComboBox DataSourceID="SqlGender" TextField="Description" ValueField="ID" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                                <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                            <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                            <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <div class="grid-wrapper">
                        <div class="grid-title bas-salaire">
                            <i class="fas fa-arrow-down"></i>
                            Plus Bas Salaires Femme
                        </div>
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="SqlSalF" Width="100%" Theme="Office365" KeyFieldName="ID">
                            <Columns>
                                <dx:GridViewDataComboBoxColumn FieldName="Number" Caption="Number">
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="ID_Sexe" Caption="Sexe">
                                    <PropertiesComboBox DataSourceID="SqlGender" TextField="Description" ValueField="ID" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom_Prenom">
                                    <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn FieldName="Description" Visible="true" />
                                <dx:GridViewDataTextColumn FieldName="salaire" Visible="True" />
                                <dx:GridViewDataDateColumn FieldName="Annee" Visible="true"></dx:GridViewDataDateColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlSalFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaireFemmeA" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSalF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaireFemme" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSalHA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaireHommeA" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSalH" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaireHomme" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="Sqlbilan" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaire" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSal" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="CountSalaireBas" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlGender" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectSexe" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>
