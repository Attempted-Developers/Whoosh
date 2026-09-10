# XML Documentation

## Introduction
The `xml` folder stores all the XML files of the website, used to give informations about the content of various different pages. By using XML we can easily edit HTML content without modifying the code itself but it's all handled through JS.  
The reason this MD file exist is to document the structure of the XML files and how the correct configuration is made. This changes per file and you must respect it without modifying the original xml code, it's allowed to add more elements to add more information but the Default elements must be added **always**.  

## XML Files Breakdown and their Default Elements

### Downloads  
The `downloads.xml` file is nothing difficult or articulated, it's just used to store data about download links.  
The structure of the file is simple:
 
```xml
<downloads>
  <release>
    <platform>Somewhere</platform>
    <version>1.0</version>
    <refName>Something</refName>
    <link>#</link>
  </release>
    ...  
</downloads>
```
<sub>*You can copy this block as a template*</sub>

---

The ```<downloads>``` block is used to store all downloads, it's the main container of it all.  
The ```<release>``` block represents a version of the release that contains all the informations about that same release inside.  
The ```<platform>``` block contains the information about the platform the service was released for with its version.  
The ```<version>``` block contains information about the version of the service.  
The ```<refName>``` block contains the reference name of the release.  
The ```<link>``` block contains the link to the download of that said release.  

> [!NOTE]  
> The version of the platform **IS INSIDE** the ```<platform>``` block and not in the ```<version>``` block. It's important to not mix those two blocks up.


### Changelog
The `changelog.xml` is also a simple xml file that stores data for the changelog that is up on the website. This is the structure:  

```xml  
<changelog>  
  <log date="">  
    <title></title>  
    <changes></changes>  
    <refName></refName>  
  </log>
 ...  
</changelog>  
```
The pattern is similar to the one of `downloads.xml` but let me break it down for you. 

---
The ```<changelog>``` block is the main block.  
The ```<log date="">``` block stores the info about the changes that an update has brought to the service, it features a **date** attribute to specify when the changelog was released.  
The ```<title>``` block just contains the title of the update.  
The ```<changes>``` block contains all the details of the update.  
The ```<refName>``` block contains the reference name of the version.  

## The Universal Extra Elements

*To be written.*

## List of the Elements

> [!NOTE]
> This list may change with the variation of the files data.

<sub>Marked elements contain attributes.</sub>  
  
```<changelog>```: The main block of the Changelog file.  
```<changes>```: Contains details about the changes of an update.  
```<downlaods>```: The main block of the Downloads file.  
```<link>```: Contains a link.  
<mark>```<log>```</mark>: Stores info about an update changelog.  
```<platform>```: Specifies a platform such as Android or iOS.  
```<refName>```: Contains a reference name of a version.  
```<release>```: Represents a version of the release that contains all the informations about that same release inside.  
```<title>```: Contains a title.  
```<version>```: Contains about the version of a service.  
