# FLAREclient-container

The FLAREclient-container provides an easy method of installing a TAXII client for our authorized partners.  This client supports TAXII 1 and 2.

## Prerequisites ##

1. Ensure Docker (or compatible container platform) that supports Linux containers is installed and running on local device. (https://docs.docker.com/get-docker/)

2. Save personal keystore as P12 with desired private key entry. (https://www.openssl.org/docs/man1.0.2/man1/pkcs12.html).  The location of this file is needed when you start the docker container.

## Quick Start ##

1. Download docker image that contains the flareclient.

``` wget https://github.com/cisagov/FLAREclient-container/releases/download/01-03-2022/ais-client_01-03-2022.tar ```

2. Load image.

```docker load -i ais-client_01-03-2022.tar```

3. Create network (if container was never started previously).

```docker network create -d bridge ais20```

4. Disable or delete old container (if container was started previously).

```# DISABLE OLD CONTAINER```<br>
```docker stop <container>```<br>
```docker update --restart=no <container>```

```# DELETE OLD CONTAINER```<br>
```docker stop <container>```<br>
```docker rm <container>```

5. Start new container.

```docker run --network ais20 -e CERT_ALIAS="<cert-alias>" -e CERT_KEYSTORE_PASS="<cert-keystore-pass>" -e CERT_TRUSTSTORE_PASS="<cert-truststore-pass>" -e FLARE_CLIENT_SVC_HOST="127.0.0.1" -e FLARE_CLIENT_SVC_PORT="8083" -e JAVA_OPTS="-Xmx2g" -e MAX_REQUEST_SIZE="150M" -e NGINX_DEBUG_LOG="false" -e NGINX_PROXY_TIMEOUT="690s" -e TIMEOUT_API="680000" -e TIMEOUT_DEFAULT="60000" -e TIMEOUT_TAXII21_DOWNLOAD="660000" -e TIMEOUT_TAXII21_MANIFEST="660000" -e TIMEOUT_TAXII21_UPLOAD="660000" -v <absolute-path-to-keystore>:/opt/app/devKeystore.p12:Z -p 443:443 -p 8083:8083 --restart unless-stopped -d ais-client:01-03-2022```

## Adding TAXII Server ##

1. Access container using web browser.

```https://127.0.0.1```

2. Sign in using credentials below.

```Username: admin```
```Password: <password>```

3. Click the ‘Servers’ link in the left navigation pane.

4. Click the ‘ADD SERVERS’ button at the top-right of page.

5. Enter the desired name in the ‘Server Label’ field.

6. Enter the TAXII Server Gateway URL for your Namespace in the ‘Discovery URL’ field.

7. OPTIONAL: Enter the desired description.

8. Click the drop-down arrow for ‘Authorization’ and select “True”.

9. Enter “admin” in the ‘Username’ field and appropriate password in ‘Password’ field.

10. Click the ‘ADD SERVER’ button.

## Publishing Content ##

1. Click the ‘+’ sign next to the appropriate TAXII server listed.

2. Click the Upload icon under the ‘Action’ column for the appropriate collection.

3. Click the ‘Browse’ button, navigate to and select the desired test file, and click ‘Open’.

4. Click the ‘Publish’ button.

## Tips ##

1. View container.

```docker ps | grep ais-client```

2. Stop container.

```docker stop <container>```

3. Start container.

```docker start <container>```

4. Restart container.

```docker restart <container>```

5. View container logs.

```docker logs <container>```

6. Sign into container.

```docker exec -it <container> /bin/bash```

7. Delete container.

```docker rm <container>```

## Issues ##

If you have issues using the code, open an issue on the repository!

You can do this by clicking "Issues" at the top and clicking "New Issue" on the following page.

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for details.

## Legal Disclaimer ##

NOTICE
<ol>
<li>This software package (“software” or “code”) is a work of the United States Government and carries no domestic copyright. Outside of the United States, this work is distributed under the Creative Commons 0 v 1.0 Universal ("CC0") License below. You may use, modify, or redistribute the code in any manner permitted by law. However, you may not subsequently assert copyright in the code as it is distributed. 
<li>Any changes submitted to this project will only be incorporated under the same terms of the CC0 license below. If you elect to contribute to the project, you agree to do so under the terms of the CC0. You are not required to contribute to this project to use, modify, or distribute it.
<li>If you decide to update or redistribute the code, please include this Notice with the code. Where relevant, we ask that you credit the Cybersecurity and Infrastructure Security Agency with the following statement: “Original code developed by the Cybersecurity and Infrastructure Security Agency (CISA), U.S. Department of Homeland Security. Visit cisa.gov for more information.”
<li>USE THIS SOFTWARE AT YOUR OWN RISK. THIS SOFTWARE COMES WITH NO WARRANTY, EITHER EXPRESS OR IMPLIED. THE UNITED STATES GOVERNMENT ASSUMES NO LIABILITY FOR THE USE OR MISUSE OF THIS SOFTWARE OR ITS DERIVATIVES.
<li>THIS SOFTWARE IS OFFERED “AS-IS.” THE UNITED STATES GOVERNMENT WILL NOT INSTALL, REMOVE, OPERATE OR SUPPORT THIS SOFTWARE AT YOUR REQUEST. IF YOU ARE UNSURE OF HOW THIS SOFTWARE WILL INTERACT WITH YOUR SYSTEM, DO NOT USE IT.
</ol>

## CC0 1.0 Universal ##
Official translations of this legal tool are available 

CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL SERVICES. DISTRIBUTION OF THIS DOCUMENT DOES NOT CREATE AN ATTORNEY-CLIENT RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED HEREUNDER, AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED HEREUNDER. 

*Statement of Purpose*

The laws of most jurisdictions throughout the world automatically confer exclusive Copyright and Related Rights (defined below) upon the creator and subsequent owner(s) (each and all, an "owner") of an original work of authorship and/or a database (each, a "Work").

Certain owners wish to permanently relinquish those rights to a Work for the purpose of contributing to a commons of creative, cultural and scientific works ("Commons") that the public can reliably and without fear of later claims of infringement build upon, modify, incorporate in other works, reuse and redistribute as freely as possible in any form whatsoever and for any purposes, including without limitation commercial purposes. These owners may contribute to the Commons to promote the ideal of a free culture and the further production of creative, cultural and scientific works, or to gain reputation or greater distribution for their Work in part through the use and efforts of others.

For these and/or other purposes and motivations, and without any expectation of additional consideration or compensation, the person associating CC0 with a Work (the "Affirmer"), to the extent that he or she is an owner of Copyright and Related Rights in the Work, voluntarily elects to apply CC0 to the Work and publicly distribute the Work under its terms, with knowledge of his or her Copyright and Related Rights in the Work and the meaning and intended legal effect of CC0 on those rights.
<ol><li><strong>Copyright and Related Rights.</strong> A Work made available under CC0 may be protected by copyright and related or neighboring rights ("Copyright and Related Rights"). Copyright and Related Rights include, but are not limited to, the following: 
<ol type="i"><li>
i. the right to reproduce, adapt, distribute, perform, display, communicate, and translate a Work;
<li>moral rights retained by the original author(s) and/or performer(s);
publicity and privacy rights pertaining to a person's image or likeness depicted in a Work;
<li>rights protecting against unfair competition in regards to a Work, subject to the limitations in paragraph 4(a), below;
rights protecting the extraction, dissemination, use and reuse of data in a Work;
<li>database rights (such as those arising under Directive 96/9/EC of the European Parliament and of the Council of 11 March 1996 on the legal protection of databases, and under any national implementation thereof, including any amended or successor version of such directive); and
<li>other similar, equivalent or corresponding rights throughout the world based on applicable law or treaty, and any national implementations thereof.
</ol>
<li><strong>Waiver.</strong> To the greatest extent permitted by, but not in contravention of, applicable law, Affirmer hereby overtly, fully, permanently, irrevocably and unconditionally waives, abandons, and surrenders all of Affirmer's Copyright and Related Rights and associated claims and causes of action, whether now known or unknown (including existing as well as future claims and causes of action), in the Work (i) in all territories worldwide, (ii) for the maximum duration provided by applicable law or treaty (including future time extensions), (iii) in any current or future medium and for any number of copies, and (iv) for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes (the "Waiver"). Affirmer makes the Waiver for the benefit of each member of the public at large and to the detriment of Affirmer's heirs and successors, fully intending that such Waiver shall not be subject to revocation, rescission, cancellation, termination, or any other legal or equitable action to disrupt the quiet enjoyment of the Work by the public as contemplated by Affirmer's express Statement of Purpose. 

<li><strong>Public License Fallback.</strong> Should any part of the Waiver for any reason be judged legally invalid or ineffective under applicable law, then the Waiver shall be preserved to the maximum extent permitted taking into account Affirmer's express Statement of Purpose. In addition, to the extent the Waiver is so judged Affirmer hereby grants to each affected person a royalty-free, non transferable, non sublicensable, non exclusive, irrevocable and unconditional license to exercise Affirmer's Copyright and Related Rights in the Work (i) in all territories worldwide, (ii) for the maximum duration provided by applicable law or treaty (including future time extensions), (iii) in any current or future medium and for any number of copies, and (iv) for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes (the "License"). The License shall be deemed effective as of the date CC0 was applied by Affirmer to the Work. Should any part of the License for any reason be judged legally invalid or ineffective under applicable law, such partial invalidity or ineffectiveness shall not invalidate the remainder of the License, and in such case Affirmer hereby affirms that he or she will not (i) exercise any of his or her remaining Copyright and Related Rights in the Work or (ii) assert any associated claims and causes of action with respect to the Work, in either case contrary to Affirmer's express Statement of Purpose.

<li> 
<strong>Limitations and Disclaimers</strong>
<ol type="a">
<li>No trademark or patent rights held by Affirmer are waived, abandoned, surrendered, licensed or otherwise affected by this document.
<li>Affirmer offers the Work as-is and makes no representations or warranties of any kind concerning the Work, express, implied, statutory or otherwise, including without limitation warranties of title, merchantability, fitness for a particular purpose, non infringement, or the absence of latent or other defects, accuracy, or the present or absence of errors, whether or not discoverable, all to the greatest extent permissible under applicable law.
<li>Affirmer disclaims responsibility for clearing rights of other persons that may apply to the Work or any use thereof, including without limitation any person's Copyright and Related Rights in the Work. Further, Affirmer disclaims responsibility for obtaining any necessary consents, permissions or other rights required for any use of the Work.
<li>Affirmer understands and acknowledges that Creative Commons is not a party to this document and has no duty or obligation with respect to this CC0 or use of the Work.
</ol>
</ol>
