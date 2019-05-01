//
//  SubdomainVisitCount.swift
//  leetcode
//
//  Created by Henry on 2019/5/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SubdomainVisitCountSolution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        if cpdomains.count == 0 {
            return []
        }
        
        var ret = [String]()
        var dictionary = ([String: Int]())
        for domain in cpdomains {
            let subStrings = domain.split(separator: " ")
            let numberString = subStrings[0]
            let number = Int(numberString)
            let domainString = subStrings[1]
            let domainComponents = domainString.split(separator: ".")
            var i = domainComponents.count - 1
            var matchedString = ""
            repeat {
                let componentString = String(domainComponents[i])
                matchedString = componentString + matchedString
                let count = dictionary[matchedString]
                if count == nil {
                    dictionary[matchedString] = number!
                } else {
                    dictionary[matchedString] = count! + number!
                }
                
                matchedString = "." + matchedString
                
                i -= 1
            } while i >= 0
        }
        for (k, v) in dictionary {
            let str = "\(v) " + k
            ret.append(str)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(subdomainVisits(["9001 discuss.leetcode.com"]))
        print(subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]))
        print(subdomainVisits(["2777 nak.mkw.co","654 yaw.lmm.ca","3528 jyx.arz.us","3215 bll.hoh.network","408 tdt.zfz.network","3322 xhe.team","8342 srp.team","9259 bfo.net","3875 brk.ato.network","2531 mce.ser.com","2471 czb.us","4806 xss.dfa.co","654 yls.yjt.co","767 irh.epf.us","1501 ara.ca","243 qay.network","9103 vbo.org","6890 bfo.network","4296 xtb.jre.us","2329 vva.qay.network","9846 fuw.org","4681 lwf.ytn.network","1781 lbk.ksc.co","7464 jpd.fff.co","2740 xhe.org","4602 weq.buf.team","3055 fdy.jkx.com","5705 mqa.wsv.net","6629 vdu.bfo.team","9897 lra.uyy.org","8167 ahm.jre.team","9374 jep.ato.co","3624 vmv.epf.network","6865 thk.net","6920 tlc.dfa.us","9372 hci.jia.network","7968 gjf.network","7292 zbl.ksc.net","2862 coh.sci.net","3855 yjt.network","1387 hju.gbq.org","817 sgp.htq.co","2406 hkb.ocf.co","622 wmt.cwn.net","9172 zfz.net","1523 suq.bhp.co","9581 gqi.team","2160 hsj.epf.org","32 ulz.com","1225 lmm.ca","1137 ujs.qzi.co","5041 cdf.hwu.us","4126 lir.ajl.team","3111 gdw.team","8928 arz.org","9531 hoh.co","7344 czb.com","2715 ubt.okv.us","1110 kdd.znq.us","5729 srp.com","6122 nqk.srp.org","7193 xth.fzx.ca","3496 ytn.com","3950 xuf.network","4521 weh.bfo.us","3262 mor.ixi.us","4975 okv.com","7089 ske.yls.com","4198 xfs.okv.co","2444 vks.gxz.team","1789 xcf.zqy.ca","7392 uyy.net","3449 tfm.us","5907 zfz.us","9530 omu.network","3314 ytd.hkt.net","9523 wyv.cgl.network","4439 gtu.us","8390 zqk.network","1627 bhp.ca","3609 bhp.team","8557 uai.lfn.net","2913 ret.ych.ca","2447 ksc.com","7476 cze.yvr.net","8544 xrj.bhp.com","6129 hkt.com","8274 ulz.co","9219 tfm.ca","5016 zwv.gqi.co","5738 lar.bfo.team","3377 jkx.network","2979 bhp.org","8176 ujm.gqs.ca","84 lmm.network","3090 ycc.yjt.us","7042 btv.com","2965 gxj.org","8263 cwn.org","1873 kse.gjf.ca"]))
    }
}
