/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package matlab;

import matlabcontrol.MatlabConnectionException;
import matlabcontrol.MatlabInvocationException;
import matlabcontrol.MatlabProxy;
import matlabcontrol.MatlabProxyFactory;

/**
 *
 * @author Freak
 */
public class Matlab {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws MatlabConnectionException, MatlabInvocationException {
         //Create a proxy, which we will use to control MATLAB
    MatlabProxyFactory factory = new MatlabProxyFactory();
    MatlabProxy proxy = factory.getProxy();

    
    //Display 'hello world' just like when using the demo
    /*proxy.eval("duracao = 1 ;");
    proxy.eval("vetorDado = msg(48000,3500,2500,16,8192,duracao);");
    //proxy.eval("plot(a)");
proxy.eval("vetorFull = insereStart(vetorDado,1,1500,8192);");
proxy.eval("audiowrite('teste1.wav',vetorFull,8192);");
    //Disconnect the proxy from MATLAB*/
    proxy.eval("duracao = 1 ;");
    proxy.eval("som=iniciaTrigger(3.75,8192,0.05,40);");
    proxy.eval("som2=transformaStart(som,2500-100,8192);");
    proxy.eval("numLido=separaBits(som2,16,8192,0.007,2.75,2200);");
    proxy.eval("disp(numLido);");
    proxy.disconnect();
    
    }
    
}
