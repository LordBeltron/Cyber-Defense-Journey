# Module Okta - Enterprise Network Zones and Authentication Policies (Okta)

## Executive Summary

This module focused on implementing enterprise network zones and network-aware authentication policies within an Okta Identity Cloud environment.

The objective was to strengthen authentication security by defining trusted and untrusted network locations, enabling adaptive authentication based on geographic location and IP address, and enforcing different authentication requirements depending on where users access enterprise resources.

The implementation began by creating static and dynamic network zones representing trusted corporate networks, approved geographic locations, and high-risk anonymizing proxy services. These zones were then incorporated into the Okta Dashboard authentication policy to enforce different authentication requirements for users connecting from trusted corporate networks, public networks, restricted countries, and Tor anonymizer proxies.

The completed policy demonstrates core Zero Trust principles by continuously evaluating user context rather than assuming trust based solely on successful authentication. Authentication decisions are influenced by network location, geographic origin, authentication strength, and possession-factor requirements.

Upon completion of this module, the Cyber Defense Journey enterprise gained adaptive authentication capabilities that more closely resemble modern enterprise identity architectures used to secure cloud applications and corporate resources.

---

# Business Problem

Traditional authentication models assume that users who successfully authenticate should receive the same level of access regardless of where they connect from. Modern enterprise environments require a more adaptive approach that evaluates contextual risk before granting access.

Organizations frequently need to distinguish between trusted corporate networks, public internet connections, approved geographic regions, and known malicious sources such as anonymizing proxy networks.

Without network-aware authentication policies, attackers who obtain valid credentials may authenticate from unknown countries or anonymous proxy services without additional scrutiny.

To reduce this risk, organizations implement network zones and adaptive authentication policies that adjust authentication requirements based on user location and network context.

This module addressed these requirements by creating trusted network zones, geographic location zones, Tor anonymizer detection, and authentication policy rules that enforce different authentication requirements depending on the source of the authentication request.

---

# Enterprise Capability Added

**Adaptive Network-Aware Authentication**

Upon completion of this module, the enterprise gained:

- Static IP Network Zones
- Dynamic Geographic Network Zones
- Tor Anonymizer Detection
- Context-Aware Authentication Policies
- Adaptive MFA Enforcement
- Network-Based Conditional Access
- Hardware-Protected MFA Requirements
- Zero Trust Authentication Controls
- Risk-Based Authentication Decisions
- Authentication Policy Testing and Validation

These capabilities significantly improve enterprise identity security by evaluating authentication requests using contextual information rather than relying solely on usernames and passwords.

---

# Module Objectives

The objectives of this module were to:

- Create a trusted Corporate Network IP zone.
- Create a dynamic Allowed Countries zone.
- Enable Push Notifications for Okta Verify.
- Build adaptive authentication policies for the Okta Dashboard.
- Deny authentication from restricted countries.
- Require stronger authentication from public networks.
- Apply different authentication requirements for trusted corporate networks.
- Block authentication attempts originating from Tor anonymizer proxies.
- Validate authentication behavior under multiple network conditions.
- Document enterprise Zero Trust authentication practices.

# Assessment

Before implementing adaptive authentication policies, the existing Okta environment was prepared by creating trusted network zones and enabling the required authentication methods. These components serve as the foundation for contextual access policies that evaluate authentication requests based on network location and risk.

Following enterprise change management practices, the environment was assessed and configured before authentication policies were introduced.

---

## Step 1 - Create the Corporate Network IP Zone

### Objective

Create a trusted IP-based network zone representing the organization's corporate network.

### Navigation

```
Admin Console
└── Security
    └── Networks
```

### Procedure

1. From the **Admin Console**, navigate to **Security → Networks**.
2. Select **Add Zone → IP Zone**.
3. For **Zone Name**, enter:

```
Corporate Network
```

4. Under **Gateway IPs**, select the current public IP address to automatically populate the field.
5. Verify the gateway IP has been added successfully.
6. Select **Save**.
7. Return to the **Networks** page.
8. Verify the **Corporate Network** zone displays a status of **Active**.

### Expected Result

A trusted IP Network Zone named **Corporate Network** has been successfully created and is available for use in authentication policies.

### Why This Matters

Static IP Network Zones establish trusted network boundaries that can be referenced by authentication policies. Users connecting from these locations can be evaluated differently than users connecting from unknown or public networks.

### Enterprise Best Practice

Organizations commonly create trusted network zones for:

- Corporate headquarters
- Branch offices
- Data centers
- VPN gateways
- Cloud egress IP addresses

These zones become reusable objects that simplify policy management across the enterprise.

### Evidence

```
Evidence/
01-create-corporate-network-zone.png
```

---

## Step 2 - Create the Allowed Countries Dynamic Zone

### Objective

Create a dynamic network zone representing approved geographic locations.

### Navigation

```
Admin Console
├── Reports
│   └── Reports
└── Security
    └── Networks
```

### Procedure

#### Determine the Current Country

1. Navigate to **Reports → Reports**.
2. Under **System Log Filters**, select **Authentication Activity**.
3. Open the most recent authentication event.
4. Select **Expand All**.
5. Locate the **Client** section.
6. Record the value for:

```
Country / Region
```

#### Create the Dynamic Network Zone

7. Navigate to **Security → Networks**.
8. Select **Add Zone → Dynamic Zone**.
9. For **Zone Name**, enter:

```
Allowed Countries
```

10. Under **Locations**, search for and select the country identified in the System Log.
11. Do **not** select a state or region.
12. Select **Save**.
13. Verify the **Allowed Countries** zone displays a status of **Active**.

### Expected Result

A Dynamic Network Zone containing approved geographic locations has been successfully created.

### Why This Matters

Dynamic Network Zones allow authentication policies to evaluate the geographic origin of authentication requests.

Organizations frequently restrict access to countries where they conduct business while denying authentication attempts originating from unexpected regions.

### Enterprise Best Practice

Country-based restrictions are commonly used to reduce:

- Credential stuffing attacks
- Password spraying
- Foreign authentication attempts
- Unauthorized account access
- Risk associated with compromised credentials

These controls are often implemented alongside adaptive authentication and risk scoring.

### Evidence

```
Evidence/
02-create-allowed-countries-zone.png
```

---

## Step 3 - Configure Okta Verify Authentication Methods

### Objective

Enable the authentication methods required to support adaptive authentication policies.

### Navigation

```
Admin Console
└── Security
    └── Authenticators
```

### Procedure

1. Navigate to **Security → Authenticators**.
2. Locate **Okta Verify**.
3. Select **Actions → Edit**.
4. Under **Verification Options**, enable:

- TOTP
- Push Notification
- Okta FastPass

5. Review the selected verification methods.
6. Select **Save**.

### Expected Result

Okta Verify supports all required authentication methods for future authentication policies.

Enabled verification methods include:

- Okta Verify TOTP
- Push Notification
- Okta FastPass

### Why This Matters

Adaptive authentication policies often require different authentication strengths depending on user context.

Enabling multiple verification methods allows authentication policies to enforce stronger authentication requirements for higher-risk scenarios while maintaining usability for trusted environments.

### Enterprise Best Practice

Organizations typically enable multiple authentication methods to support:

- Risk-based authentication
- Adaptive MFA
- Passwordless authentication
- Hardware-protected authenticators
- Phishing-resistant authentication
- Improved user experience

Authentication methods should be enabled before policy implementation to prevent policy failures during deployment.

### Evidence

```
Evidence/
03-enable-okta-verify-options.png
```

---

# Implementation

After establishing the required network zones and authentication methods, adaptive authentication policies were implemented for the Okta Dashboard.

Rather than applying identical authentication requirements to every user, policy decisions were made based on network location and contextual risk. This approach aligns with Zero Trust principles by continuously evaluating each authentication request before granting access.

---

# Step 4 - Configure the Restricted Countries Authentication Rule

### Objective

Prevent users from authenticating to the Okta Dashboard when connecting from countries outside the organization's approved geographic locations.

### Navigation

```
Admin Console
└── Security
    └── Authentication Policies
        └── App Sign-in
            └── Okta Dashboard Policy
```

### Procedure

1. Navigate to **Security → Authentication Policies**.
2. Select **App Sign-in**.
3. Open the **Okta Dashboard** authentication policy.
4. Select **Add Rule**.
5. For **Rule Name**, enter:

```
Restricted Countries
```

### Configure the IF Conditions

Configure the following conditions:

| Setting | Value |
|----------|-------|
| User's Group Membership | Pilot Users |
| User's IP | **Not in Allowed Countries** |

### Configure the THEN Conditions

Configure:

| Setting | Value |
|----------|-------|
| Access | Denied |

7. Save the rule.
8. Verify that **Restricted Countries** appears as **Priority 1**.

### Expected Result

Users belonging to the **Pilot Users** group are denied access whenever authentication originates from a country outside the **Allowed Countries** dynamic network zone.

### Why This Matters

Restricting authentication based on geographic location reduces the organization's attack surface by preventing login attempts from countries where the business does not operate.

This control is commonly implemented to mitigate:

- Credential stuffing
- Password spraying
- Account takeover
- Foreign login attempts

### Enterprise Best Practice

Organizations typically deploy geographic restrictions to pilot groups before expanding enforcement across the enterprise. This minimizes operational risk while validating policy behavior.

### Evidence

```
Evidence/
04-restricted-countries-rule.png
```

---

# Step 5 - Configure the Public Network Authentication Rule

### Objective

Require stronger authentication when users access enterprise resources from untrusted public networks.

### Navigation

```
Admin Console
└── Security
    └── Authentication Policies
        └── Okta Dashboard Policy
```

### Procedure

1. Select **Add Rule**.
2. For **Rule Name**, enter:

```
Public Network
```

### Configure the IF Conditions

| Setting | Value |
|----------|-------|
| User's Group Membership | Pilot Users |
| User's IP | Not in Corporate Network |

### Configure the THEN Conditions

Configure the following:

| Setting | Value |
|----------|-------|
| Access | Allow after successful authentication |
| Authentication Requirement | Any 2 Factor Types |
| Possession Constraint | Hardware Protected |
| User Interaction | Required |
| Phishing Resistant | Disabled |
| Authentication Methods | Allow any method satisfying the policy |
| Prompt Frequency | Every sign in |

5. Verify that **Okta Verify TOTP** is **NOT** listed as an acceptable authenticator.

6. Save the rule.

7. Verify the rule appears as **Priority 2**.

### Expected Result

Users connecting from public or untrusted networks must authenticate using a hardware-protected possession factor requiring user interaction.

### Why This Matters

Public networks present increased risk because organizations cannot control the surrounding environment.

Requiring stronger authentication significantly reduces the likelihood that compromised credentials alone can be used to gain access.

### Enterprise Best Practice

Many organizations increase authentication requirements whenever users authenticate from unmanaged networks, home internet connections, public Wi-Fi, or unknown IP addresses.

### Evidence

```
Evidence/
05-public-network-rule.png
```

---

# Step 6 - Configure the Corporate Network Authentication Rule

### Objective

Allow authentication from trusted corporate networks while maintaining multi-factor authentication requirements.

### Navigation

```
Admin Console
└── Security
    └── Authentication Policies
        └── Okta Dashboard Policy
```

### Procedure

1. Select **Add Rule**.
2. Enter the rule name:

```
Corporate Network
```

### Configure the IF Conditions

| Setting | Value |
|----------|-------|
| User's Group Membership | Pilot Users |
| User's IP | In Corporate Network |

### Configure the THEN Conditions

Configure:

| Setting | Value |
|----------|-------|
| Access | Allow after successful authentication |
| Authentication Requirement | Any 2 Factor Types |
| Possession Constraint | User Interaction Required |
| Hardware Protected | Disabled |
| Phishing Resistant | Disabled |
| Authentication Methods | Allow any method satisfying policy |
| Prompt Frequency | Every sign in |

5. Verify that **Okta Verify TOTP** is included as an acceptable authenticator.

6. Save the rule.

7. Verify the rule appears as **Priority 3**.

### Expected Result

Users connecting from trusted corporate networks are granted access after satisfying the organization's MFA requirements.

### Why This Matters

Trusted network locations reduce environmental risk while still requiring multi-factor authentication.

Organizations often balance security and user experience by applying different authentication requirements depending on network trust.

### Enterprise Best Practice

Even on trusted corporate networks, modern Zero Trust architectures continue to require MFA rather than relying solely on network location as proof of trust.

### Evidence

```
Evidence/
06-corporate-network-rule.png
```
---

# Validation

After implementing the network zones and adaptive authentication policies, the configuration was validated to ensure that each rule behaved as expected under different network conditions.

Testing included authentication attempts from both trusted and untrusted networks, verification of available authentication methods, and review of the Okta System Log to confirm that the correct authentication policy rules were evaluated.

---

## Step 7 - Test Public Network Authentication

### Objective

Validate that users connecting from a public network are required to use a hardware-protected possession factor requiring user interaction.

### Preparation

1. Navigate to **Security → Networks**.
2. Edit the **Corporate Network** IP Zone.
3. Replace the current Gateway IP with:

```
10.10.10.10
```

This temporarily causes the current connection to be treated as a **Public Network**.

4. Save the changes.

### Procedure

1. Open a new **Incognito** browser window.
2. Navigate to the Okta organization sign-in page.
3. Sign in as the test user:

```
Krista Scott
```

4. Select **Next**.
5. If prompted, select **Verify with something else**.
6. Confirm that:

```
Enter a code (Okta Verify)
```

is **NOT** available.
7. Complete authentication using an **Okta Verify Push Notification**.
8. Sign out of the account.

### Validate the System Log

1. Return to the Administrator session.
2. Navigate to:

```
Reports
└── System Log
```

3. Search for:

```
Evaluation of sign-on policy
```

4. Open the most recent event.
5. Verify the event contains a target for:

```
Public Network
```

### Expected Result

Authentication succeeds only after satisfying the stronger authentication requirements defined by the **Public Network** rule.

The System Log confirms that the **Public Network** authentication rule was evaluated.

### Why This Matters

Public networks present increased security risk because organizations have no control over the surrounding environment.

Requiring stronger authentication significantly reduces the likelihood that compromised credentials alone can be used to access enterprise resources.

### Enterprise Best Practice

Organizations commonly require stronger authentication whenever users authenticate from:

- Home networks
- Public Wi-Fi
- Hotel networks
- Coffee shops
- Untrusted Internet connections

### Evidence

```
Evidence/
07-public-network-authentication-test.png
```

---

## Step 8 - Test Corporate Network Authentication

### Objective

Validate that users connecting from the trusted Corporate Network receive the authentication experience defined by the Corporate Network policy.

### Preparation

1. Navigate to **Security → Networks**.
2. Edit the **Corporate Network** IP Zone.
3. Replace:

```
10.10.10.10
```

with the current public Gateway IP.

4. Save the changes.

### Procedure

1. Open the browser used for the test user.
2. Sign in as:

```
Krista Scott
```

3. Select **Next**.
4. If prompted, select **Verify with something else**.
5. Confirm that:

```
Enter a code (Okta Verify)
```

**is available**.
6. Authenticate using:

- Password
- Okta Verify TOTP

7. Sign out.

### Validate the System Log

1. Return to the Administrator session.
2. Navigate to:

```
Reports
└── System Log
```

3. Search for:

```
Evaluation of sign-on policy
```

4. Open the most recent authentication event.
5. Verify the event contains a target for:

```
Corporate Network
```

### Expected Result

Authentication succeeds using the Corporate Network authentication policy.

The available authentication methods match the policy configuration.

The System Log confirms that the **Corporate Network** rule was evaluated.

### Why This Matters

Validation confirms that trusted network zones are correctly identified and that policy decisions change dynamically based on network context.

### Enterprise Best Practice

Every authentication policy should be tested under each expected condition before deployment to production users.

Policy validation helps identify configuration errors before they impact business operations.

### Evidence

```
Evidence/
08-corporate-network-authentication-test.png
```

---

## Step 9 - Test Tor Anonymizer Protection

### Objective

Verify that authentication requests originating from Tor anonymizer proxies are denied.

### Navigation

```
Admin Console
└── Security
    └── Networks
```

### Procedure

1. Create a Dynamic Network Zone named:

```
Block Tor Anonymizer Proxies
```

2. Enable:

```
Block access from IPs matching conditions listed in this zone.
```

3. Select:

```
Tor Anonymizer Proxy
```

4. Save the configuration.
5. Verify the zone status is **Active**.
6. Open the **Tor Browser**.
7. Navigate to the Okta organization sign-in page.
8. Attempt to authenticate.
9. Confirm access is denied.

### Expected Result

Authentication requests originating from Tor exit nodes are denied before access is granted.

### Why This Matters

Tor anonymizer networks intentionally conceal the source of authentication requests and are frequently abused by attackers attempting credential stuffing, password spraying, and account compromise.

Blocking Tor significantly reduces exposure to anonymous attack traffic.

### Enterprise Best Practice

Organizations commonly block authentication attempts originating from:

- Tor Exit Nodes
- Anonymous Proxy Services
- Known VPN Providers
- High-Risk IP Reputation Sources

These controls are often integrated with adaptive authentication and threat intelligence feeds.

### Evidence

```
Evidence/
09-tor-anonymizer-block-test.png
```

---

# Enterprise Value

This module demonstrates the implementation of adaptive authentication controls using Okta Network Zones and Authentication Policies to enforce context-aware access decisions.

Rather than applying identical authentication requirements to every user, authentication decisions are based on contextual factors including network location, geographic origin, and authentication strength. This approach aligns with Zero Trust security principles by continuously evaluating each authentication request before granting access.

By implementing trusted network zones, dynamic geographic zones, Tor anonymizer detection, and conditional authentication policies, the Cyber Defense Journey enterprise significantly strengthened its identity security posture while maintaining an appropriate balance between security and user experience.

These controls reduce the attack surface by denying authentication from unauthorized locations, increasing authentication requirements for higher-risk environments, and ensuring that users connecting from trusted corporate networks continue to satisfy multi-factor authentication requirements.

---

# Enterprise Relevance

The technologies and concepts implemented throughout this module closely mirror those used by enterprise Identity and Access Management (IAM) teams responsible for securing cloud applications and workforce identities.

Common enterprise use cases include:

- Implementing Zero Trust authentication strategies.
- Deploying Conditional Access policies.
- Restricting authentication by geographic location.
- Identifying trusted corporate network locations.
- Increasing authentication requirements for public networks.
- Blocking authentication attempts originating from anonymizing proxy services.
- Enforcing hardware-protected authentication methods.
- Supporting phased policy deployments using pilot groups.
- Monitoring authentication policy evaluation through audit logs.

These capabilities are widely implemented across enterprise identity platforms including Okta, Microsoft Entra ID, Ping Identity, Duo Security, and other modern Identity Providers (IdPs).

---

# Interview Readiness

This module provides practical experience with several concepts frequently discussed during Identity and Access Management interviews.

---

## What is a Network Zone?

A Network Zone is a reusable object that identifies authentication requests based on IP address ranges, geographic locations, or other contextual information.

Network Zones allow authentication policies to evaluate where a user is connecting from before determining whether access should be granted.

---

## Why implement Conditional Access?

Conditional Access allows organizations to make authentication decisions based on contextual risk rather than relying solely on usernames and passwords.

Common evaluation criteria include:

- Network location
- Geographic location
- Device trust
- Authentication strength
- User risk
- Sign-in risk

This approach supports Zero Trust by continuously validating trust before granting access.

---

## Why create separate authentication policies for corporate and public networks?

Different network environments present different levels of risk.

Corporate networks are generally considered more trusted because they are managed and monitored by the organization.

Public networks introduce additional uncertainty, requiring stronger authentication controls such as hardware-protected possession factors and increased MFA requirements.

---

## Why block Tor anonymizer proxies?

Tor is designed to conceal a user's true network location.

While it provides anonymity for legitimate users, it is also commonly leveraged by attackers attempting:

- Credential stuffing
- Password spraying
- Account takeover
- Identity reconnaissance

Blocking Tor reduces anonymous attack traffic while improving the organization's visibility into authentication requests.

---

## What is Zero Trust?

Zero Trust is a security model that assumes no user, device, or network should be trusted by default.

Every authentication request must be continuously evaluated using contextual signals before access is granted.

Rather than assuming trust because a user is on the corporate network, Zero Trust evaluates:

- Identity
- Device
- Network
- Authentication strength
- Risk

before making an authorization decision.

---

# Lessons Learned

This module demonstrated that effective Identity and Access Management extends well beyond usernames, passwords, and traditional multi-factor authentication.

Modern IAM platforms continuously evaluate contextual information such as network location, geographic origin, authentication strength, and risk before granting access.

Implementing reusable Network Zones simplified authentication policy management by allowing policies to reference logical security boundaries instead of individual IP addresses or countries.

One of the most valuable takeaways from this module was understanding how authentication policies can dynamically adapt to different operating environments while still providing a consistent user experience.

The phased deployment approach using a Pilot Users group also reinforced an important operational principle: enterprise authentication policies should be tested with a limited audience before broad deployment to reduce operational risk.

---

# Next Module

## Enterprise Adaptive Authentication and Risk Policies

The next module expands upon the foundation established here by introducing additional adaptive authentication capabilities and advanced identity protection features.

Future topics include:

- Risk-based authentication
- Device context evaluation
- Adaptive MFA
- Authentication policy optimization
- Session controls
- Identity threat protection
- Continuous access evaluation
- Authentication auditing and reporting

Upon completion of the next module, the Cyber Defense Journey enterprise will continue evolving toward a mature Zero Trust identity architecture capable of protecting both on-premises and cloud-based resources.