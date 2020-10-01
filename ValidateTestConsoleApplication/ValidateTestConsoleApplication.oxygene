<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <RootNamespace>ValidateTestConsoleApplication</RootNamespace>
    <OutputType>Exe</OutputType>
    <AssemblyName>ValidateTestConsoleApplication</AssemblyName>
    <AllowGlobals>false</AllowGlobals>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>false</AllowLegacyCreate>
    <ApplicationIcon>Properties/App.ico</ApplicationIcon>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <ProjectGuid>{C44D2320-8162-44DA-A784-3B126AC384A7}</ProjectGuid>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <SchemaVersion>2.0</SchemaVersion>
    <DelphiDivide>false</DelphiDivide>
    <DelphiCompatibility>false</DelphiCompatibility>
    <ProjectType>Exe</ProjectType>
    <AllowLegacyWith>false</AllowLegacyWith>
    <NoRequireOutParam>true</NoRequireOutParam>
    <UnsafeCode>false</UnsafeCode>
    <AllowInlineVars>false</AllowInlineVars>
    <EnableDefaultClasses>false</EnableDefaultClasses>
    <AssemblyDelaySign>false</AssemblyDelaySign>
    <TargetFramework>.NETFramework4.7.2</TargetFramework>
    <PreBuildEvent />
    <PostBuildEvent />
    <RunPostBuildEvent>OnBuildSuccess</RunPostBuildEvent>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>.\bin\Debug</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>.\bin\Release</OutputPath>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)' == 'Debug'">
    <DebugType>none</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Debug</OutputPath>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <WebDebugTarget>Cassini</WebDebugTarget>
    <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
    <UseXmlDoc>false</UseXmlDoc>
    <RunCodeAnalysis>false</RunCodeAnalysis>
    <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
    <RemoteDebugEnabled>false</RemoteDebugEnabled>
    <XmlAllMembers>false</XmlAllMembers>
    <WebLaunchBrowser>false</WebLaunchBrowser>
    <CodeFlowAnalysis>true</CodeFlowAnalysis>
    <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
    <RuntimeVersion>v25</RuntimeVersion>
    <GeneratePDB>true</GeneratePDB>
    <GenerateMDB>true</GenerateMDB>
    <EnableAssert>true</EnableAssert>
    <RegisterComInterop>false</RegisterComInterop>
    <CpuType>anycpu</CpuType>
    <CaptureConsoleOutput>false</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)' == 'Release'">
    <DebugType>none</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release</OutputPath>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
    <RuntimeVersion>v25</RuntimeVersion>
    <UseXmlDoc>false</UseXmlDoc>
    <WebDebugTarget>Cassini</WebDebugTarget>
    <RunCodeAnalysis>false</RunCodeAnalysis>
    <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
    <RemoteDebugEnabled>false</RemoteDebugEnabled>
    <XmlAllMembers>false</XmlAllMembers>
    <WebLaunchBrowser>false</WebLaunchBrowser>
    <CodeFlowAnalysis>true</CodeFlowAnalysis>
    <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
    <GenerateMDB>false</GenerateMDB>
    <GeneratePDB>false</GeneratePDB>
    <CpuType>anycpu</CpuType>
    <RegisterComInterop>false</RegisterComInterop>
    <CaptureConsoleOutput>false</CaptureConsoleOutput>
    <EnableAssert>true</EnableAssert>
    <StartMode>Project</StartMode>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="System" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data" />
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml" />
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <ProjectReference Include="Validation">
      <HintPath>..\Validation\bin\Debug\Validation.dll</HintPath>
      <Project>{F806783B-51DF-472E-8C66-22E67E494CAC}</Project>
      <ProjectFile>..\Validation\Validation.oxygene</ProjectFile>
      <Private>True</Private>
    </ProjectReference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Program.pas" />
    <Content Include="Properties\App.ico" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <EmbeddedResource Include="Properties\Resources.resx">
      <Generator>ResXFileCodeGenerator</Generator>
    </EmbeddedResource>
    <Compile Include="Properties\Resources.Designer.pas" />
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
    </None>
    <Compile Include="Properties\Settings.Designer.pas" />
    <Compile Include="Employee.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Elements\RemObjects.Elements.Echoes.targets" />
</Project>