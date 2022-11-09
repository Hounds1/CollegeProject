package kr.ac.kopo.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
public class MultipartBinder {
    public String operate(MultipartFile target) {


        String fileRealName = target.getOriginalFilename();

        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
        String uploadFolder = "D:\\test\\upload";

        UUID uuid = UUID.randomUUID();

        String[] uuids = uuid.toString().split("-");

        String uniqueName = uuids[0];

        File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);
        try {
            log.info("--------file save log----------");
            log.info(String.valueOf(saveFile));
            log.info("--------file save log----------");
            target.transferTo(saveFile);

        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return uniqueName + fileExtension;
    }
}
