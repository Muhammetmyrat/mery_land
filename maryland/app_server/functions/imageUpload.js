const { error } = require('console')
const fs = require('fs')
const { resolve } = require('path')
const path = require('path')



function deleteFile(imagepath){
    if(fs.existsSync(imagepath)){
       fs.unlink(imagepath,(error)=>{
           if(error){
               console.log('file deletes eror:'+error)
           }
           else{
               console.log('File deleted sucsesfully')
           }
       })
    }
    else{
        console.log('File doesnt exist')
    }
}


function deleteFolder(folder){
      if(fs.existsSync(folder)){
          fs.rmdir(folder,{ recursive: true },(error)=>{
            //  error ? console.log(`Folder deleted error:${error}`) : console.log('Folder deleted successfully');
              if(error){
                  console.log('Folder deleted eror:'+error)
              }
              else{
                  console.log('Folder deleted successfully')
              }
          })
      }
      else{
          console.log('Doesnt exist folder')
      }
}


function oneImageUpload(image,folder){
    return new Promise((resolve)=>{
    if(!fs.existsSync(path.normalize(__dirname + '../../../uploads/' + folder))){
      fs.mkdirSync(path.normalize(__dirname + '../../../uploads/' + folder))
    }

    const timePath = Date.now()
    const pathMV = path.normalize(__dirname + "../../../uploads/" + folder + '/') + timePath

    image.mv(pathMV+'.jpg',(error)=>{
        if(error){
            console.log('File upload error:'+error)
            resolve(false)
        }
        else{
            console.log('File upload sucsesfully')
            resolve('/uploads/' + folder + '/' + timePath + '.jpg')
        }
    })
 })
}


function oneImageUploadsvg(image,folder){
    return new Promise((resolve)=>{
    if(!fs.existsSync(path.normalize(__dirname + '../../../uploads/' + folder))){
      fs.mkdirSync(path.normalize(__dirname + '../../../uploads/' + folder))
    }

    
    const pathMV = path.normalize(__dirname + "../../../uploads/" + folder + '/') + image.name

    image.mv(pathMV,(error)=>{
        if(error){
            console.log('File upload error:'+error)
            resolve(false)
        }
        else{
            console.log('File upload sucsesfully')
            resolve('/uploads/' + folder + '/' + image.name)
        }
    })
 })
}





module.exports={
    deleteFile,
    deleteFolder,
    oneImageUpload,
    oneImageUploadsvg,
}