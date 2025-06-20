package org.example;

import net.sf.saxon.lib.ExtensionFunctionDefinition;
import net.sf.saxon.s9api.*;
import org.expath.httpclient.saxon.SendRequestFunction;

import java.io.File;

public class Main {
    public static void main(String[] args) throws SaxonApiException {
        Processor processor = new Processor();

        processor.registerExtensionFunction((ExtensionFunctionDefinition) new SendRequestFunction());

        XsltCompiler xsltCompiler = processor.newXsltCompiler();

        XsltExecutable xsltExecutable = xsltCompiler.compile(new File("request-test1.xsl"));

        Xslt30Transformer xslt30Transformer = xsltExecutable.load30();

        xslt30Transformer.callTemplate(null, xslt30Transformer.newSerializer(System.out));

    }
}