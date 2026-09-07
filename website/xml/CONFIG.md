# XML Documentation

## Introduction
The `xml` folder stores all the XML files of the website, used to give informations about the content of various different pages. By using XML we can easily edit HTML content without modifying the code itself but it's all handled through JS.  
The reason this MD file exist is to document the structure of the XML files and how the correct configuration is made. This changes per file and you must respect it without modifying the original xml code, it's allowed to add more elements to add more information but the Default elements must be added **always**.  


## Downloads  
The `downloads.xml` is nothing difficult or articulated, it's just used to store data about download links.  
The structure of the file is simple:
 
```xml
<downloads>
  <release>
    <platform>iOS 11</platform>
    <version>1.0</version>
    <refName>Aero Alpha</refName>
    <link></link>
  </release>
    ...  
</downloads>
```

The ```<downloads>``` block is used to store all downloads, it's the main container of it all.  
The ```<release>``` block represents a version of the release that contains all the informations about that same release inside.  
The ```<platform>``` block contains the information about the platform the service was released for with its version.  
The ```<version>``` block contains information about the version of the service.  
The ```<refName>``` block contains the reference name of the release.  
The ```<link>``` block contains the link to the download of that said release.  

> [!NOTE]  
> The version of the platform **IS INSIDE** the ```<platform>``` block and not in the ```<version>``` block. It's important to not mix those two blocks up.
